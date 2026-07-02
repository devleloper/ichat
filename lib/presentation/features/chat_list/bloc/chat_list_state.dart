import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/room/room.dart';
import '../../../../domain/entities/user/user.dart';

part 'chat_list_state.freezed.dart';

@freezed
sealed class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = ChatListInitialState;
  const factory ChatListState.loading() = ChatListLoadingState;
  const factory ChatListState.loaded({
    required List<Room> rooms,
    required Map<String, User> userCache,
    required String currentUserId,
  }) = ChatListLoadedState;
  const factory ChatListState.error(String message) = ChatListErrorState;
}
