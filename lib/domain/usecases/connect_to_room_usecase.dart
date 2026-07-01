import '../repositories/i_chat_repository.dart';

final class ConnectToRoomUseCase {
  const ConnectToRoomUseCase(this._repository);
  final IChatRepository _repository;
  Future<void> call(String roomId, String userId) =>
      _repository.connect(roomId, userId);
}
