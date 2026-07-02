// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_ws_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomingWsMessageDto _$IncomingWsMessageDtoFromJson(
  Map<String, dynamic> json,
) => _IncomingWsMessageDto(
  type: json['type'] as String,
  text: json['text'] as String?,
  clientMessageId: json['client_message_id'] as String?,
);

Map<String, dynamic> _$IncomingWsMessageDtoToJson(
  _IncomingWsMessageDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
  'client_message_id': instance.clientMessageId,
};
