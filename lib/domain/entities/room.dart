import 'package:equatable/equatable.dart';
import 'message.dart';

class Room extends Equatable {
  final String id;
  final String userAId;
  final String userBId;
  final DateTime createdAt;
  final Message? lastMessage;

  const Room({
    required this.id,
    required this.userAId,
    required this.userBId,
    required this.createdAt,
    this.lastMessage,
  });

  Room copyWith({
    String? id,
    String? userAId,
    String? userBId,
    DateTime? createdAt,
    Message? lastMessage,
  }) {
    return Room(
      id: id ?? this.id,
      userAId: userAId ?? this.userAId,
      userBId: userBId ?? this.userBId,
      createdAt: createdAt ?? this.createdAt,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  @override
  List<Object?> get props => [id, userAId, userBId, createdAt, lastMessage];
}
