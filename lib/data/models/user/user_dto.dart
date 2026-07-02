import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  User toEntity() {
    return User(id: id, name: name, createdAt: createdAt);
  }

  factory UserDto.fromEntity(User entity) {
    return UserDto(
      id: entity.id,
      name: entity.name,
      createdAt: entity.createdAt,
    );
  }
}
