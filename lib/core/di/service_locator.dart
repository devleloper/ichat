import 'package:get_it/get_it.dart';

import '../../data/network/api_client.dart';
import '../../data/network/websocket_client.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/chat_repository.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../../domain/usecases/connect_to_room_usecase.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../domain/usecases/get_messages_usecase.dart';
import '../../domain/usecases/get_rooms_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../config/app_config.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  const config = AppConfig.local;

  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(baseUrl: config.apiBaseUrl),
  );
  getIt.registerLazySingleton<WebSocketClient>(
    () => WebSocketClient(baseUrl: config.wsBaseUrl),
  );

  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository(getIt()));
  getIt.registerLazySingleton<IChatRepository>(
    () => ChatRepository(getIt(), getIt()),
  );

  final authRepo = getIt<IAuthRepository>() as AuthRepository;
  await authRepo.init();

  getIt.registerLazySingleton(() => GetUsersUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateUserUseCase(getIt()));
  getIt.registerLazySingleton(() => GetRoomsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMessagesUseCase(getIt()));
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => ConnectToRoomUseCase(getIt()));
}
