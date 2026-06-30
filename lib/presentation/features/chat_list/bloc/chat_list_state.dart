import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/room.dart';
import '../../../../domain/entities/user.dart';

part 'chat_list_state.freezed.dart';

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = ChatListInitialState;
  const factory ChatListState.loading() = ChatListLoadingState;
  const factory ChatListState.loaded(
    List<Room> rooms,
    Map<String, User> userCache,
  ) = LoadedState;
  const factory ChatListState.error(String message) = ChatListErrorState;
}
