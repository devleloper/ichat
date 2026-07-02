// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => _RoomDto(
  id: json['id'] as String,
  userAId: json['user_a_id'] as String,
  userBId: json['user_b_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  lastMessage: json['last_message'] == null
      ? null
      : MessageDto.fromJson(json['last_message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoomDtoToJson(_RoomDto instance) => <String, dynamic>{
  'id': instance.id,
  'user_a_id': instance.userAId,
  'user_b_id': instance.userBId,
  'created_at': instance.createdAt.toIso8601String(),
  'last_message': instance.lastMessage,
};
