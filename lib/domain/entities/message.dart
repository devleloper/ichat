import 'package:equatable/equatable.dart';

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}

class Message extends Equatable {
  final int id;
  final String roomId;
  final String senderId;
  final String text;
  final MessageStatus status;
  final DateTime createdAt;
  final String? clientMessageId;

  const Message({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.text,
    required this.status,
    required this.createdAt,
    this.clientMessageId,
  });

  Message copyWith({
    int? id,
    String? roomId,
    String? senderId,
    String? text,
    MessageStatus? status,
    DateTime? createdAt,
    String? clientMessageId,
  }) {
    return Message(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      senderId: senderId ?? this.senderId,
      text: text ?? this.text,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      clientMessageId: clientMessageId ?? this.clientMessageId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        roomId,
        senderId,
        text,
        status,
        createdAt,
        clientMessageId,
      ];
}
