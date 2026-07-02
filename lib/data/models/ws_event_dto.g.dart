// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WsEventDto _$WsEventDtoFromJson(Map<String, dynamic> json) => _WsEventDto(
  type: json['type'] as String,
  roomId: json['room_id'] as String?,
  userId: json['user_id'] as String?,
  text: json['text'] as String?,
  clientMessageId: json['client_message_id'] as String?,
  message: json['message'] == null
      ? null
      : MessageDto.fromJson(json['message'] as Map<String, dynamic>),
  error: json['error'] as String?,
);

Map<String, dynamic> _$WsEventDtoToJson(_WsEventDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'room_id': instance.roomId,
      'user_id': instance.userId,
      'text': instance.text,
      'client_message_id': instance.clientMessageId,
      'message': instance.message,
      'error': instance.error,
    };
