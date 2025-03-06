// lib/features/messenger/injection_container.dart
import 'package:gaana/gaana.dart';
import 'package:gaana_messenger/core/use_cases/bot_response_use_case.dart';
import 'package:gaana_messenger/core/use_cases/delete_message_use_case.dart';
import 'package:gaana_messenger/features/messenger/data/datasources/demo_user_datasource.dart';
import '../../di/injector.dart';
import './data/datasources/demo_message_datasource.dart';
import './data/repositories/user_repository_impl.dart';
import './data/repositories/message_repository_impl.dart';
import '../../core/repositories/user_repository.dart';
import '../../core/repositories/message_repository.dart';
import '../../core/use_cases/fetch_users_use_case.dart';
import '../../core/use_cases/fetch_messages_use_case.dart';
import '../../core/use_cases/send_message_use_case.dart';
import './presentation/controllers/user_controller.dart';
import './presentation/controllers/chat_controller.dart';

final injector = Injector();

Future<void> initMessenger() async {
  // Data sources
  injector.registerSingleton<DemoUserDataSource>(DemoUserDataSourceImpl());
  injector.registerSingleton<DemoMessageDataSource>(
    DemoMessageDataSourceImpl(),
  );

  // Repositories
  injector.registerSingleton<UserRepository>(
    UserRepositoryImpl(dataSource: injector.get<DemoUserDataSource>()),
  );
  injector.registerSingleton<MessageRepository>(
    MessageRepositoryImpl(dataSource: injector.get<DemoMessageDataSource>()),
  );

  // Use cases
  injector.registerSingleton<FetchUsersUseCase>(
    FetchUsersUseCase(injector.get<UserRepository>()),
  );
  injector.registerSingleton<FetchMessagesUseCase>(
    FetchMessagesUseCase(injector.get<MessageRepository>()),
  );
  injector.registerSingleton<SendMessageUseCase>(
    SendMessageUseCase(injector.get<MessageRepository>()),
  );
  injector.registerSingleton<DeleteMessageUseCase>(
    DeleteMessageUseCase(injector.get<MessageRepository>()),
  );
  injector.registerSingleton<BotResponseUseCase>(BotResponseUseCase());

  // Controllers (presenters)
  // injector.registerFactory<UserController>(
  //   () => UserController(fetchUsersUseCase: injector.get<FetchUsersUseCase>()),
  // );
  injector.registerSingleton(
    UserController(fetchUsersUseCase: injector.get<FetchUsersUseCase>()),
  );
  // injector.registerFactory<ChatController>(
  //   () => ChatController(
  //     fetchMessagesUseCase: injector.get<FetchMessagesUseCase>(),
  //     sendMessageUseCase: injector.get<SendMessageUseCase>(),
  //   ),
  // );
  injector.registerSingleton(
    ChatController(
      fetchMessagesUseCase: injector.get<FetchMessagesUseCase>(),
      sendMessageUseCase: injector.get<SendMessageUseCase>(),
      deleteMessageUseCase: injector.get<DeleteMessageUseCase>(),
      botResponseUseCase: injector.get<BotResponseUseCase>(),
    ),
  );
  // Then add them to the compositeNotifier Gaana State management
  GaanaService.instance.add(injector.get<UserController>());
  GaanaService.instance.add(injector.get<ChatController>());
}
