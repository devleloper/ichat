import 'package:freezed_annotation/freezed_annotation.dart';
import '../message/message_dto.dart';

part 'ws_event_dto.freezed.dart';
part 'ws_event_dto.g.dart';

@freezed
abstract class WsEventDto with _$WsEventDto {
  const factory WsEventDto({
    required String type,
    @JsonKey(name: 'room_id') String? roomId,
    @JsonKey(name: 'user_id') String? userId,
    String? text,
    @JsonKey(name: 'client_message_id') String? clientMessageId,
    MessageDto? message,
    String? error,
  }) = _WsEventDto;

  factory WsEventDto.fromJson(Map<String, dynamic> json) =>
      _$WsEventDtoFromJson(json);
}
