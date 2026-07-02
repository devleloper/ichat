// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/room.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/repositories/i_chat_repository.dart';
import '../../../../domain/usecases/get_rooms_usecase.dart';
import '../../../../domain/usecases/get_users_usecase.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;
  final GetRoomsUseCase _getRoomsUseCase;
  final GetUsersUseCase _getUsersUseCase;

  late final StreamSubscription<dynamic> _messageSubscription;

  ChatListBloc({
    required IChatRepository chatRepository,
    required IAuthRepository authRepository,
    required GetRoomsUseCase getRoomsUseCase,
    required GetUsersUseCase getUsersUseCase,
  }) : _chatRepository = chatRepository,
       _authRepository = authRepository,
       _getRoomsUseCase = getRoomsUseCase,
       _getUsersUseCase = getUsersUseCase,
       super(const ChatListState.initial()) {
    on<ChatListLoadRoomsEvent>(_onLoadRooms);
    on<ChatListCreateRoomEvent>(_onCreateRoom);
    on<ChatListMessageReceivedEvent>(_onMessageReceived);

    _messageSubscription = _chatRepository.messageStream.listen((message) {
      add(ChatListEvent.messageReceived(message));
    });
  }

  @override
  Future<void> close() {
    _messageSubscription.cancel();
    return super.close();
  }

  Future<void> _onLoadRooms(
    ChatListLoadRoomsEvent event,
    Emitter<ChatListState> emit,
  ) async {
    emit(const ChatListState.loading());
    try {
      final currentUser = _authRepository.currentUser;
      if (currentUser == null) {
        emit(const ChatListState.error('Not authenticated'));
        return;
      }

      final rooms = await _getRoomsUseCase(currentUser.id);
      final allUsers = await _getUsersUseCase();
      final userCache = {for (final u in allUsers) u.id: u};

      emit(
        ChatListState.loaded(
          rooms: rooms,
          userCache: userCache,
          currentUserId: currentUser.id,
        ),
      );
    } catch (e) {
      emit(ChatListState.error(e.toString()));
    }
  }

  Future<void> _onCreateRoom(
    ChatListCreateRoomEvent event,
    Emitter<ChatListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ChatListLoadedState) return;

    try {
      final currentUser = _authRepository.currentUser;
      if (currentUser == null) return;

      final room = await _chatRepository.createDirectRoom(
        currentUser.id,
        event.targetUserId,
      );

      final rooms = List<Room>.from(currentState.rooms);
      if (!rooms.any((r) => r.id == room.id)) {
        rooms.insert(0, room);
      }

      emit(currentState.copyWith(rooms: rooms));
    } catch (_) {}
  }

  void _onMessageReceived(
    ChatListMessageReceivedEvent event,
    Emitter<ChatListState> emit,
  ) {
    final currentState = state;
    if (currentState is! ChatListLoadedState) return;

    final updatedRooms = List<Room>.from(currentState.rooms);
    final roomIndex = updatedRooms.indexWhere(
      (r) => r.id == event.message.roomId,
    );

    if (roomIndex != -1) {
      updatedRooms[roomIndex] = updatedRooms[roomIndex].copyWith(
        lastMessage: event.message,
      );
      final promoted = updatedRooms.removeAt(roomIndex);
      updatedRooms.insert(0, promoted);
      emit(currentState.copyWith(rooms: updatedRooms));
    }
  }
}
