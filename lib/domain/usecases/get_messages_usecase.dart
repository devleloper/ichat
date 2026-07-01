import '../entities/message.dart';
import '../repositories/i_chat_repository.dart';

final class GetMessagesUseCase {
  const GetMessagesUseCase(this._repository);
  final IChatRepository _repository;
  Future<List<Message>> call(String roomId, String userId) =>
      _repository.getMessages(roomId, userId);
}
