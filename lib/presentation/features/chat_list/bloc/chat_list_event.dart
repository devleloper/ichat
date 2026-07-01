import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/message.dart';

part 'chat_list_event.freezed.dart';

@freezed
sealed class ChatListEvent with _$ChatListEvent {
  const factory ChatListEvent.loadRooms() = ChatListLoadRoomsEvent;
  const factory ChatListEvent.createRoom(String targetUserId) =
      ChatListCreateRoomEvent;
  const factory ChatListEvent.messageReceived(Message message) =
      ChatListMessageReceivedEvent;
}
