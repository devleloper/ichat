import '../entities/room.dart';
import '../repositories/i_chat_repository.dart';

final class GetRoomsUseCase {
  const GetRoomsUseCase(this._repository);
  final IChatRepository _repository;
  Future<List<Room>> call(String userId) => _repository.getRooms(userId);
}
