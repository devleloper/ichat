// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/message.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/repositories/i_chat_repository.dart';
import 'chat_room_event.dart';
import 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final String _roomId;
  
  StreamSubscription<Message>? _messageSubscription;
  StreamSubscription<String>? _typingSubscription;
  Timer? _typingTimer;
  DateTime? _lastTypingSentTime;
  final _uuid = const Uuid();

  ChatRoomBloc({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required String roomId,
  })  : _chatRepository = chatRepository,
        _authRepository = authRepository,
        _roomId = roomId,
        super(const ChatRoomState.initial()) {
    on<LoadMessagesEvent>(_onLoadMessages);
    on<SendMessageEvent>(_onSendMessage);
    on<MessageReceivedEvent>(_onMessageReceived);
    on<MessageErrorEvent>(_onMessageError);
    on<SendTypingEvent>(_onSendTyping);
    on<UserTypingEvent>(_onUserTyping);
    on<ResetTypingEvent>(_onResetTyping);

    _messageSubscription = _chatRepository.messageStream.listen((message) {
      add(ChatRoomEvent.messageReceived(message));
    });

    _typingSubscription = _chatRepository.typingStream.listen((userId) {
      add(ChatRoomEvent.userTyping(userId));
    });
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _typingSubscription?.cancel();
    _typingTimer?.cancel();
    _chatRepository.disconnect();
    return super.close();
  }

  Future<void> _onLoadMessages(
    LoadMessagesEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(const ChatRoomState.loading());
    try {
      final user = await _authRepository.getCurrentUser();
      if (user == null) {
        emit(const ChatRoomState.error('User not authenticated'));
        return;
      }

      final messages = await _chatRepository.getMessages(_roomId, user.id);
      
      await _chatRepository.connect(_roomId, user.id);
      
      final sortedMessages = List<Message>.from(messages)
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(ChatRoomState.loaded(messages: sortedMessages));
    } catch (e) {
      emit(ChatRoomState.error(e.toString()));
    }
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final user = await _authRepository.getCurrentUser();
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

    final updatedMessages = List<Message>.from(currentState.messages)
      ..insert(0, optimisticMessage);
      
    emit(ChatRoomState.loaded(messages: updatedMessages));

    try {
      await _chatRepository.sendMessage(optimisticMessage);
    } catch (e) {
      add(ChatRoomEvent.messageError(clientMessageId, e.toString()));
    }
  }

  Future<void> _onMessageReceived(
    MessageReceivedEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
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
        emit(ChatRoomState.loaded(messages: updatedMessages));
        return;
      }
    }

    updatedMessages.insert(0, incoming);
    emit(ChatRoomState.loaded(messages: updatedMessages, isOtherUserTyping: currentState.isOtherUserTyping));
  }

  Future<void> _onMessageError(
    MessageErrorEvent event,
    Emitter<ChatRoomState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;

    final updatedMessages = List<Message>.from(currentState.messages);
    final index = updatedMessages.indexWhere(
      (m) => m.clientMessageId == event.clientMessageId,
    );

    if (index != -1) {
      final oldMessage = updatedMessages[index];
      updatedMessages[index] = Message(
        id: oldMessage.id,
        roomId: oldMessage.roomId,
        senderId: oldMessage.senderId,
        text: oldMessage.text,
        status: MessageStatus.failed,
        createdAt: oldMessage.createdAt,
        clientMessageId: oldMessage.clientMessageId,
      );
      emit(ChatRoomState.loaded(messages: updatedMessages, isOtherUserTyping: currentState.isOtherUserTyping));
    }
  }

  void _onSendTyping(SendTypingEvent event, Emitter<ChatRoomState> emit) {
    if (state is! ChatRoomLoadedState) return;
    
    final now = DateTime.now();
    if (_lastTypingSentTime == null || now.difference(_lastTypingSentTime!).inSeconds > 2) {
      _lastTypingSentTime = now;
      _chatRepository.sendTyping();
    }
  }

  Future<void> _onUserTyping(UserTypingEvent event, Emitter<ChatRoomState> emit) async {
    final currentState = state;
    if (currentState is! ChatRoomLoadedState) return;
    
    final user = await _authRepository.getCurrentUser();
    if (user == null || event.userId == user.id) return;

    emit(currentState.copyWith(isOtherUserTyping: true));
    
    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 3), () {
      add(const ChatRoomEvent.resetTyping());
    });
  }

  void _onResetTyping(ResetTypingEvent event, Emitter<ChatRoomState> emit) {
    final currentState = state;
    if (currentState is ChatRoomLoadedState) {
      emit(currentState.copyWith(isOtherUserTyping: false));
    }
  }
}
