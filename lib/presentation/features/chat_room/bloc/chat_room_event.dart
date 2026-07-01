import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/message.dart';

part 'chat_room_event.freezed.dart';

@freezed
sealed class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.loadMessages() = ChatRoomLoadMessagesEvent;
  const factory ChatRoomEvent.sendMessage(String text) =
      ChatRoomSendMessageEvent;
  const factory ChatRoomEvent.messageReceived(Message message) =
      ChatRoomMessageReceivedEvent;
  const factory ChatRoomEvent.messageError(
    String clientMessageId,
    String error,
  ) = ChatRoomMessageErrorEvent;
  const factory ChatRoomEvent.sendTyping() = ChatRoomSendTypingEvent;
  const factory ChatRoomEvent.userTyping(String userId) =
      ChatRoomUserTypingEvent;
  const factory ChatRoomEvent.resetTyping() = ChatRoomResetTypingEvent;
}
