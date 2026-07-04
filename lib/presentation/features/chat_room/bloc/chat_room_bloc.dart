// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/message/message.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/repositories/i_chat_repository.dart';
import '../../../../domain/usecases/room/connect_to_room_usecase.dart';
import '../../../../core/services/audio_service.dart';
import '../../../../domain/usecases/message/get_messages_usecase.dart';
import '../../../../domain/usecases/message/send_message_usecase.dart';
import 'chat_room_event.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final GetMessagesUseCase _getMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ConnectToRoomUseCase _connectToRoomUseCase;
  final AudioService _audioService;
  final String _roomId;

  StreamSubscription<Message>? _messageSubscription;
  StreamSubscription<String>? _typingSubscription;
  StreamSubscription<void>? _readySubscription;
  Timer? _typingTimer;
  DateTime? _lastTypingSentTime;
  final _uuid = const Uuid();

  ChatRoomBloc({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required GetMessagesUseCase getMessagesUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required ConnectToRoomUseCase connectToRoomUseCase,
    required AudioService audioService,
    required String roomId,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _getMessagesUseCase = getMessagesUseCase,
       _sendMessageUseCase = sendMessageUseCase,
       _connectToRoomUseCase = connectToRoomUseCase,
       _audioService = audioService,
       _roomId = roomId,
       super(const ChatRoomState.initial()) {
    on<ChatRoomLoadMessagesEvent>(_onLoadMessages);
    on<ChatRoomSendMessageEvent>(_onSendMessage);
    on<ChatRoomMessageReceivedEvent>(_onMessageReceived);
    on<ChatRoomMessageErrorEvent>(_onMessageError);
    on<ChatRoomSendTypingEvent>(_onSendTyping);
    on<ChatRoomUserTypingEvent>(_onUserTyping);
    on<ChatRoomResetTypingEvent>(_onResetTyping);

    _messageSubscription = _chatRepository.messageStream.listen((message) {
      if (message.roomId == _roomId) {
        add(ChatRoomEvent.messageReceived(message));
      }
    });

    _typingSubscription = _chatRepository.typingStream.listen((userId) {
      add(ChatRoomEvent.userTyping(userId));
    });

    _readySubscription = _chatRepository.readyStream.listen((_) {
      add(const ChatRoomEvent.loadMessages());
    });
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _typingSubscription?.cancel();
    _readySubscription?.cancel();
    _typingTimer?.cancel();
    _chatRepository.disconnect();
    return super.close();
  }

  Future<void> _onLoadMessages(
    ChatRoomLoadMessagesEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) {
      emit(const ChatRoomState.loading());
    }
    try {
      final user = _authRepository.currentUser;
      if (user == null) {
        emit(const ChatRoomState.error('User not authenticated'));
        return;
      }

      final messages = await _getMessagesUseCase(_roomId, user.id);
      await _connectToRoomUseCase(_roomId, user.id);

      final sortedMessages = List<Message>.from(messages)
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      if (currentState is ChatRoomLoadedState) {
        final pendingMessages = currentState.messages
            .where((m) => m.status != MessageStatus.sent)
            .toList();

        for (final pending in pendingMessages) {
          final isAlreadyInList = sortedMessages.any(
            (m) =>
                m.clientMessageId == pending.clientMessageId ||
                (m.text == pending.text && m.senderId == pending.senderId),
          );

          if (!isAlreadyInList) {
            sortedMessages.insert(0, pending);
          }
        }
      }

      emit(
        ChatRoomState.loaded(messages: sortedMessages, currentUserId: user.id),
      );
    } catch (e) {
      emit(ChatRoomState.error(e.toString()));
    }
  }

  Future<void> _onSendMessage(
    ChatRoomSendMessageEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final user = _authRepository.currentUser;
    if (user == null) return;

    final clientMessageId = _uuid.v4();
    final optimisticMessage = Message(
      id: 0,
      roomId: _roomId,
      senderId: user.id,
      text: event.text,
      status: MessageStatus.sending,
      createdAt: DateTime.now(),
      clientMessageId: clientMessageId,
    );

    emit(
      currentState.copyWith(
        messages: [optimisticMessage, ...currentState.messages],
      ),
    );
    
    _audioService.playSendSound();

    try {
      await _sendMessageUseCase(optimisticMessage);
    } catch (e) {
      add(ChatRoomEvent.messageError(clientMessageId, e.toString()));
    }
  }

  void _onMessageReceived(
    ChatRoomMessageReceivedEvent event,
    Emitter<ChatRoomState> emit,
  ) {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final incoming = event.message;
    final updatedMessages = List<Message>.from(currentState.messages);

    if (incoming.clientMessageId != null) {
      final index = updatedMessages.indexWhere(
        (m) => m.clientMessageId == incoming.clientMessageId,
      );
      if (index != -1) {
        updatedMessages[index] = incoming;
        emit(currentState.copyWith(messages: updatedMessages));
        return;
      }
    }

    updatedMessages.insert(0, incoming);
    emit(currentState.copyWith(messages: updatedMessages));
    
    if (incoming.senderId != currentState.currentUserId) {
      _audioService.playReceiveSound();
    }
  }

  void _onMessageError(
    ChatRoomMessageErrorEvent event,
    Emitter<ChatRoomState> emit,
  ) {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final updatedMessages = List<Message>.from(currentState.messages);
    final index = updatedMessages.indexWhere(
      (m) => m.clientMessageId == event.clientMessageId,
    );

    if (index != -1) {
      updatedMessages[index] = updatedMessages[index].copyWith(
        status: MessageStatus.failed,
      );
      emit(currentState.copyWith(messages: updatedMessages));
    }
  }

  void _onSendTyping(
    ChatRoomSendTypingEvent event,
    Emitter<ChatRoomState> emit,
  ) {
    if (state is! ChatRoomLoadedState) return;

    final now = DateTime.now();
    if (_lastTypingSentTime == null ||
        now.difference(_lastTypingSentTime!).inSeconds > 2) {
      _lastTypingSentTime = now;
      _chatRepository.sendTyping();
    }
  }

  Future<void> _onUserTyping(
    ChatRoomUserTypingEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final user = _authRepository.currentUser;
    if (user == null || event.userId == user.id) return;

    emit(currentState.copyWith(isOtherUserTyping: true));

    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 3), () {
      add(const ChatRoomEvent.resetTyping());
    });
  }

  void _onResetTyping(
    ChatRoomResetTypingEvent event,
    Emitter<ChatRoomState> emit,
  ) {
    final currentState = state;
    if (currentState is ChatRoomLoadedState) {
      emit(currentState.copyWith(isOtherUserTyping: false));
    }
  }
}
