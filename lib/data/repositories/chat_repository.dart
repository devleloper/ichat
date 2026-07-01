import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/room.dart';
import '../../domain/failures/app_failure.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../models/message_dto.dart';
import '../models/room_dto.dart';
import '../models/incoming_ws_message_dto.dart';
import '../network/api_client.dart';
import '../network/websocket_client.dart';

class ChatRepository implements IChatRepository {
  final ApiClient _apiClient;
  final WebSocketClient _wsClient;

  final StreamController<Message> _messageStreamController =
      StreamController<Message>.broadcast();
  final StreamController<String> _typingStreamController =
      StreamController<String>.broadcast();
  final StreamController<void> _readyStreamController =
      StreamController<void>.broadcast();

  late final StreamSubscription<dynamic> _wsSubscription;

  ChatRepository(this._apiClient, this._wsClient) {
    _wsSubscription = _wsClient.stream.listen((eventDto) {
      if (eventDto.type == 'message.created' && eventDto.message != null) {
        final messageEntity = eventDto.message!.toEntity().copyWith(
          clientMessageId: eventDto.clientMessageId,
        );
        _messageStreamController.add(messageEntity);
      } else if (eventDto.type == 'user.typing' && eventDto.userId != null) {
        _typingStreamController.add(eventDto.userId!);
      } else if (eventDto.type == 'ready') {
        _readyStreamController.add(null);
      }
    });
  }

  void dispose() {
    _wsSubscription.cancel();
    _messageStreamController.close();
    _typingStreamController.close();
    _readyStreamController.close();
  }

  @override
  Future<List<Room>> getRooms(String userId) async {
    try {
      final response = await _apiClient.dio.get(
        '/api/rooms',
        queryParameters: {'user_id': userId},
      );
      final data = response.data['items'] as List<dynamic>?;
      if (data == null) return [];
      return data
          .map(
            (json) => RoomDto.fromJson(json as Map<String, dynamic>).toEntity(),
          )
          .toList();
    } on DioException catch (e) {
      throw NetworkFailure(message: e.message ?? 'Network error');
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
      throw NetworkFailure(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<List<Message>> getMessages(String roomId, String userId) async {
    try {
      final response = await _apiClient.dio.get(
        '/api/rooms/$roomId/messages',
        queryParameters: {'user_id': userId, 'limit': 50},
      );
      final data = response.data['items'] as List<dynamic>?;
      if (data == null) return [];
      return data
          .map(
            (json) =>
                MessageDto.fromJson(json as Map<String, dynamic>).toEntity(),
          )
          .toList();
    } on DioException catch (e) {
      throw NetworkFailure(message: e.message ?? 'Network error');
    }
  }

  @override
  Stream<Message> get messageStream => _messageStreamController.stream;

  @override
  Stream<String> get typingStream => _typingStreamController.stream;

  @override
  Stream<void> get readyStream => _readyStreamController.stream;

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
  void sendTyping() {
    _wsClient.send(const IncomingWsMessageDto(type: 'typing'));
  }

  @override
  void disconnect() {
    _wsClient.disconnect();
  }
}
