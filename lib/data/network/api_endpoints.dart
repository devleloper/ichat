class ApiEndpoints {
  const ApiEndpoints._();
  static const String users = '/api/users';
  static const String rooms = '/api/rooms';
  static const String directRoom = '/api/rooms/direct';

  static String roomMessages(String roomId) => '/api/rooms/$roomId/messages';
}
