// ignore_for_file: prefer_initializing_formals

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/ws_event_dto.dart';
import '../models/incoming_ws_message_dto.dart';

class WebSocketClient {
  final String _baseUrl;
  WebSocketChannel? _channel;
  StreamController<WsEventDto>? _streamController;
  Timer? _reconnectTimer;
  bool _isConnected = false;
  String? _currentRoomId;
  String? _currentUserId;

  WebSocketClient({required String baseUrl}) : _baseUrl = baseUrl;

  Stream<WsEventDto> get stream {
    _streamController ??= StreamController<WsEventDto>.broadcast();
    return _streamController!.stream;
  }

  void connect(String roomId, String userId) {
    if (_isConnected) return;
    _currentRoomId = roomId;
    _currentUserId = userId;
    
    final wsUrl = Uri.parse('$_baseUrl?room_id=$roomId&user_id=$userId');
    _channel = WebSocketChannel.connect(wsUrl);
    _isConnected = true;

    _channel!.stream.listen(
      (message) {
        try {
          final jsonMap = jsonDecode(message as String) as Map<String, dynamic>;
          final event = WsEventDto.fromJson(jsonMap);
          _streamController?.add(event);
        } catch (e) {
          debugPrint('WebSocket message decode error: $e');
        }
      },
      onDone: () {
        _isConnected = false;
        _scheduleReconnect();
      },
      onError: (error) {
        _isConnected = false;
        _scheduleReconnect();
      },
    );
  }

  void send(IncomingWsMessageDto payload) {
    if (_isConnected && _channel != null) {
      final message = jsonEncode(payload.toJson());
      _channel!.sink.add(message);
    }
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 3), () {
      if (!_isConnected && _currentRoomId != null && _currentUserId != null) {
        connect(_currentRoomId!, _currentUserId!);
      }
    });
  }

  void disconnect() {
    _isConnected = false;
    _currentRoomId = null;
    _currentUserId = null;
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
  }
}
