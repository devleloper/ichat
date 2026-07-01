import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/message.dart';

part 'chat_room_event.freezed.dart';

@freezed
sealed class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.loadMessages() = LoadMessagesEvent;
  const factory ChatRoomEvent.sendMessage(String text) = SendMessageEvent;
  const factory ChatRoomEvent.messageReceived(Message message) = MessageReceivedEvent;
  const factory ChatRoomEvent.messageError(String clientMessageId, String error) = MessageErrorEvent;
  const factory ChatRoomEvent.sendTyping() = SendTypingEvent;
  const factory ChatRoomEvent.userTyping(String userId) = UserTypingEvent;
  const factory ChatRoomEvent.resetTyping() = ResetTypingEvent;
}
