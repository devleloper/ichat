import 'package:flutter/foundation.dart';

class AppConfig {
  final String apiBaseUrl;
  final String wsBaseUrl;

  const AppConfig({required this.apiBaseUrl, required this.wsBaseUrl});

  static String get _host {
    if (kIsWeb) return 'localhost';
    if (defaultTargetPlatform == TargetPlatform.android) return '10.0.2.2';
    return 'localhost';
  }

  static AppConfig get local => AppConfig(
        apiBaseUrl: 'http://$_host:8088',
        wsBaseUrl: 'ws://$_host:8088/ws',
      );
}
