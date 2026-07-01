class AppConfig {
  final String apiBaseUrl;
  final String wsBaseUrl;

  const AppConfig({required this.apiBaseUrl, required this.wsBaseUrl});

  static const AppConfig local = AppConfig(
    apiBaseUrl: 'http://localhost:8088',
    wsBaseUrl: 'ws://localhost:8088/ws',
  );
}
