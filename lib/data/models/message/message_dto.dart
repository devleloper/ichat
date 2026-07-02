import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/message/message.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  const factory MessageDto({
    required int id,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'sender_id') required String senderId,
    required String text,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MessageDto;

  const MessageDto._();

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  Message toEntity({
    MessageStatus status = MessageStatus.sent,
    String? clientMessageId,
  }) {
    return Message(
      id: id,
      roomId: roomId,
      senderId: senderId,
      text: text,
      status: status,
      createdAt: createdAt,
      clientMessageId: clientMessageId,
    );
  }

  factory MessageDto.fromEntity(Message entity) {
    return MessageDto(
      id: entity.id,
      roomId: entity.roomId,
      senderId: entity.senderId,
      text: entity.text,
      createdAt: entity.createdAt,
    );
  }
}
