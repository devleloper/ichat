import 'dart:async';
import 'dart:developer';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/ws_event/ws_event_dto.dart';
import '../models/incoming_ws_message/incoming_ws_message_dto.dart';

class WebSocketClient {
  final String _baseUrl;
  WebSocketChannel? _channel;
  StreamController<WsEventDto>? _streamController;
  Timer? _reconnectTimer;
  bool _isConnected = false;
  bool _hasReceivedFirstMessage = false;
  String? _currentRoomId;
  String? _currentUserId;
  int _reconnectAttempts = 0;
  final List<IncomingWsMessageDto> _pendingMessages = [];

  static const int _maxBackoffSeconds = 30;

  WebSocketClient({required this._baseUrl});

  Stream<WsEventDto> get stream {
    _streamController ??= StreamController<WsEventDto>.broadcast();
    return _streamController!.stream;
  }

  void connect(String roomId, String userId) {
    if (_isConnected) return;
    _currentRoomId = roomId;
    _currentUserId = userId;
    _hasReceivedFirstMessage = false;

    final wsUrl = Uri.parse('$_baseUrl?room_id=$roomId&user_id=$userId');
    _channel = WebSocketChannel.connect(wsUrl);

    _channel!.stream.listen(
      (message) {
        if (!_hasReceivedFirstMessage) {
          _hasReceivedFirstMessage = true;
          _isConnected = true;
          _reconnectAttempts = 0;
          for (final msg in _pendingMessages) {
            send(msg);
          }
          _pendingMessages.clear();
        }
        try {
          final jsonMap = jsonDecode(message as String) as Map<String, dynamic>;
          final event = WsEventDto.fromJson(jsonMap);
          _streamController?.add(event);
        } catch (e) {
          log(
            'WebSocketClient: message decode error: $e',
            name: 'WebSocketClient',
          );
        }
      },
      onDone: () {
        _isConnected = false;
        _scheduleReconnect();
      },
      onError: (Object error) {
        _isConnected = false;
        log('WebSocketClient: error: $error', name: 'WebSocketClient');
        _scheduleReconnect();
      },
    );
  }

  void send(IncomingWsMessageDto payload) {
    if (_isConnected && _channel != null) {
      try {
        _channel!.sink.add(jsonEncode(payload.toJson()));
      } catch (e) {
        log('WebSocketClient: send error: $e', name: 'WebSocketClient');
      }
    } else {
      _pendingMessages.add(payload);
    }
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    final delaySecs = (_reconnectAttempts < 8)
        ? (1 << _reconnectAttempts).clamp(1, _maxBackoffSeconds)
        : _maxBackoffSeconds;
    _reconnectAttempts++;

    _reconnectTimer = Timer(Duration(seconds: delaySecs), () {
      if (!_isConnected && _currentRoomId != null && _currentUserId != null) {
        connect(_currentRoomId!, _currentUserId!);
      }
    });
  }

  void disconnect() {
    _isConnected = false;
    _hasReceivedFirstMessage = false;
    _reconnectAttempts = 0;
    _currentRoomId = null;
    _currentUserId = null;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _channel?.sink.close();
    _channel = null;
    _pendingMessages.clear();
  }
}
