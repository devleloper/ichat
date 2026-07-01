import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/message.dart';

part 'chat_list_event.freezed.dart';

@freezed
class ChatListEvent with _$ChatListEvent {
  const factory ChatListEvent.loadRooms() = LoadRoomsEvent;
  const factory ChatListEvent.createRoom(String targetUserId) = CreateRoomEvent;
  const factory ChatListEvent.messageReceived(Message message) = MessageReceivedEvent;
}
