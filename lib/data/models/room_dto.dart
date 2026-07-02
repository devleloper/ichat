import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/room.dart';
import 'message_dto.dart';

part 'room_dto.freezed.dart';
part 'room_dto.g.dart';

@freezed
abstract class RoomDto with _$RoomDto {
  const factory RoomDto({
    required String id,
    @JsonKey(name: 'user_a_id') required String userAId,
    @JsonKey(name: 'user_b_id') required String userBId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'last_message') MessageDto? lastMessage,
  }) = _RoomDto;

  const RoomDto._();

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);

  Room toEntity() {
    return Room(
      id: id,
      userAId: userAId,
      userBId: userBId,
      createdAt: createdAt,
      lastMessage: lastMessage?.toEntity(),
    );
  }

  factory RoomDto.fromEntity(Room entity) {
    return RoomDto(
      id: entity.id,
      userAId: entity.userAId,
      userBId: entity.userBId,
      createdAt: entity.createdAt,
      lastMessage: entity.lastMessage != null
          ? MessageDto.fromEntity(entity.lastMessage!)
          : null,
    );
  }
}
