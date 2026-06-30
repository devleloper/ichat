import 'package:freezed_annotation/freezed_annotation.dart';

part 'incoming_ws_message_dto.freezed.dart';
part 'incoming_ws_message_dto.g.dart';

@freezed
abstract class IncomingWsMessageDto with _$IncomingWsMessageDto {
  const factory IncomingWsMessageDto({
    required String type,
    String? text,
    @JsonKey(name: 'client_message_id') String? clientMessageId,
  }) = _IncomingWsMessageDto;

  factory IncomingWsMessageDto.fromJson(Map<String, dynamic> json) => _$IncomingWsMessageDtoFromJson(json);
}
