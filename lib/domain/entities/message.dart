import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

enum MessageStatus { sending, sent, delivered, read, failed }

@freezed
abstract class Message with _$Message {
  const factory Message({
    required int id,
    required String roomId,
    required String senderId,
    required String text,
    required MessageStatus status,
    required DateTime createdAt,
    String? clientMessageId,
  }) = _Message;
}
