import '../../entities/message/message.dart';
import '../../repositories/i_chat_repository.dart';

final class SendMessageUseCase {
  const SendMessageUseCase(this._repository);
  final IChatRepository _repository;
  Future<void> call(Message message) => _repository.sendMessage(message);
}
