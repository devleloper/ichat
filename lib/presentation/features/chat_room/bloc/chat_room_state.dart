import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/message.dart';

part 'chat_room_state.freezed.dart';

@freezed
sealed class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.initial() = ChatRoomInitialState;
  const factory ChatRoomState.loading() = ChatRoomLoadingState;
  const factory ChatRoomState.loaded({
    required List<Message> messages,
    @Default(false) bool isOtherUserTyping,
  }) = ChatRoomLoadedState;
  const factory ChatRoomState.error(String message) = ChatRoomErrorState;
}
