import 'package:freezed_annotation/freezed_annotation.dart';
import '../message/message.dart';

part 'room.freezed.dart';

@freezed
abstract class Room with _$Room {
  const factory Room({
    required String id,
    required String userAId,
    required String userBId,
    required DateTime createdAt,
    Message? lastMessage,
  }) = _Room;
}
