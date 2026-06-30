import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/room.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../models/message_dto.dart';
import '../models/room_dto.dart';
import '../models/incoming_ws_message_dto.dart';
import '../network/api_client.dart';
import '../network/websocket_client.dart';

class ChatRepository implements IChatRepository {
  final ApiClient _apiClient;
  final WebSocketClient _wsClient;
  
  final StreamController<Message> _messageStreamController = StreamController<Message>.broadcast();

  ChatRepository(this._apiClient, this._wsClient) {
    _wsClient.stream.listen((eventDto) {
      if (eventDto.type == 'message.created' && eventDto.message != null) {
        _messageStreamController.add(eventDto.message!.toEntity());
      }
    });
  }

  @override
  Future<List<Room>> getRooms(String userId) async {
    try {
      final response = await _apiClient.dio.get('/api/rooms?user_id=$userId');
      final data = response.data['items'] as List<dynamic>;
      return data
          .map((json) => RoomDto.fromJson(json as Map<String, dynamic>).toEntity())
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to get rooms: ${e.message}');
    }
  }

  @override
  Future<Room> createDirectRoom(String userAId, String userBId) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/rooms/direct',
        data: {'user_a_id': userAId, 'user_b_id': userBId},
      );
      return RoomDto.fromJson(response.data as Map<String, dynamic>).toEntity();
    } on DioException catch (e) {
      throw Exception('Failed to create room: ${e.message}');
    }
  }

  @override
  Future<List<Message>> getMessages(String roomId, String userId) async {
    try {
      final response = await _apiClient.dio.get('/api/rooms/$roomId/messages?user_id=$userId');
      final data = response.data['items'] as List<dynamic>;
      return data
          .map((json) => MessageDto.fromJson(json as Map<String, dynamic>).toEntity())
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to get messages: ${e.message}');
    }
  }

  @override
  Stream<Message> get messageStream => _messageStreamController.stream;

  @override
  Future<void> connect(String roomId, String userId) async {
    _wsClient.connect(roomId, userId);
  }

  @override
  Future<void> sendMessage(Message message) async {
    final payload = IncomingWsMessageDto(
      type: 'message.send',
      text: message.text,
      clientMessageId: message.clientMessageId,
    );
    _wsClient.send(payload);
  }

  @override
  void disconnect() {
    _wsClient.disconnect();
  }
}
