import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/repositories/i_chat_repository.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final IChatRepository _chatRepository;
  final IAuthRepository _authRepository;

  ChatListBloc(this._chatRepository, this._authRepository)
      : super(const ChatListState.initial()) {
    on<LoadRoomsEvent>(_onLoadRooms);
    on<CreateRoomEvent>(_onCreateRoom);
  }

  Future<void> _onLoadRooms(
      LoadRoomsEvent event, Emitter<ChatListState> emit) async {
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
      CreateRoomEvent event, Emitter<ChatListState> emit) async {
    final currentState = state;
    if (currentState is! LoadedState) return;

    try {
      final currentUser = await _authRepository.getCurrentUser();
      if (currentUser == null) return;

      final room = await _chatRepository.createDirectRoom(
          currentUser.id, event.targetUserId);

      final rooms = List.of(currentState.rooms);
      if (!rooms.any((r) => r.id == room.id)) {
        rooms.insert(0, room);
      }

      emit(currentState.copyWith(rooms: rooms));
    } catch (e) {
      print('Error creating room: $e');
    }
  }
}
