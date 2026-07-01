import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/room.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/repositories/i_chat_repository.dart';
import 'package:flutter/foundation.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  late final StreamSubscription _messageSubscription;

  ChatListBloc(this._chatRepository, this._authRepository)
    : super(const ChatListState.initial()) {
    on<LoadRoomsEvent>(_onLoadRooms);
    on<CreateRoomEvent>(_onCreateRoom);
    on<MessageReceivedEvent>(_onMessageReceived);

    _messageSubscription = _chatRepository.messageStream.listen((message) {
      add(MessageReceivedEvent(message));
    });
  }

  @override
  Future<void> close() {
    _messageSubscription.cancel();
    return super.close();
  }

  Future<void> _onLoadRooms(
    LoadRoomsEvent event,
    Emitter<ChatListState> emit,
  ) async {
    emit(const ChatListState.loading());
    try {
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null) {
        emit(const ChatListState.error('Not authenticated'));
        return;
      }

      final rooms = await _chatRepository.getRooms(currentUser.id);

      final allUsers = await _authRepository.getUsers();
      final userCache = {for (var u in allUsers) u.id: u};

      emit(ChatListState.loaded(rooms, userCache));
    } catch (e) {
      emit(ChatListState.error(e.toString()));
    }
  }

  Future<void> _onCreateRoom(
    CreateRoomEvent event,
    Emitter<ChatListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LoadedState) return;

    try {
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null) return;

      final room = await _chatRepository.createDirectRoom(
        currentUser.id,
        event.targetUserId,
      );

      final rooms = List.of(currentState.rooms);
      if (!rooms.any((r) => r.id == room.id)) {
        rooms.insert(0, room);
      }

      emit(currentState.copyWith(rooms: rooms));
    } catch (e) {
      debugPrint('Error creating room: $e');
    }
  }

  void _onMessageReceived(
    MessageReceivedEvent event,
    Emitter<ChatListState> emit,
  ) {
    final currentState = state;
    if (currentState is! LoadedState) return;

    final updatedRooms = List<Room>.from(currentState.rooms);
    final roomIndex = updatedRooms.indexWhere(
      (r) => r.id == event.message.roomId,
    );

    if (roomIndex != -1) {
      final room = updatedRooms[roomIndex];
      updatedRooms[roomIndex] = room.copyWith(lastMessage: event.message);
      final updatedRoom = updatedRooms.removeAt(roomIndex);
      updatedRooms.insert(0, updatedRoom);

      emit(currentState.copyWith(rooms: updatedRooms));
    }
  }
}
