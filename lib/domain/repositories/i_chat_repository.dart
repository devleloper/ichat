import '../entities/message.dart';
import '../entities/room.dart';

abstract class IChatRepository {
  Future<List<Room>> getRooms(String userId);
  Future<Room> createDirectRoom(String userAId, String userBId);
  Future<List<Message>> getMessages(String roomId, String userId);
  
  Stream<Message> get messageStream;
  Future<void> connect(String roomId, String userId);
  Future<void> sendMessage(Message message);
  void disconnect();
}
