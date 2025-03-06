// import 'package:flutter/foundation.dart';

// class DependencyContainer {
//   static DependencyContainer? _instance;

//   // Private constructor
//   DependencyContainer._();

//   static DependencyContainer get instance {
//     if (_instance == null) {
//       throw Exception(
//         'DependencyContainer not initialized. Call initMessenger() first.',
//       );
//     }
//     return _instance!;
//   }

//   final _singletonInstances = <Type, Object>{};
//   final _singletonFactories = <Type, Object Function(DependencyContainer)>{};
//   final _factoryMethods = <Type, Object Function(DependencyContainer)>{};

//   void registerSingleton<T>(T Function(DependencyContainer) factory) {
//     _singletonFactories[T] = factory;
//   }


//   void registerFactory<T>(T Function(DependencyContainer) factory) {
//     _factoryMethods[T] = factory;
//   }

//   T get<T>() {
//     if (_singletonInstances.containsKey(T)) {
//       return _singletonInstances[T] as T;
//     }

//     if (_singletonFactories.containsKey(T)) {
//       final instance = _singletonFactories[T]!(this) as T;
//       _singletonInstances[T] = instance;
//       return instance;
//     }

//     if (_factoryMethods.containsKey(T)) {
//       return _factoryMethods[T]!(this) as T;
//     }

//     throw Exception('No dependency registered for type $T');
//   }
// }

// // Initialization function
// void initMessenger() {
//   final container = DependencyContainer._();

//   // Data sources
//   container.registerSingleton<DemoUserDataSource>(
//     (_) => DemoUserDataSourceImpl(),
//   );
//   container.registerSingleton<DemoMessageDataSource>(
//     (_) => DemoMessageDataSourceImpl(),
//   );

//   // Repositories
//   container.registerSingleton<UserRepository>(
//     (c) => UserRepositoryImpl(dataSource: c.get<DemoUserDataSource>()),
//   );
//   container.registerSingleton<MessageRepository>(
//     (c) => MessageRepositoryImpl(dataSource: c.get<DemoMessageDataSource>()),
//   );

//   // Use cases
//   container.registerSingleton<FetchUsersUseCase>(
//     (c) => FetchUsersUseCase(c.get<UserRepository>()),
//   );
//   container.registerSingleton<FetchMessagesUseCase>(
//     (c) => FetchMessagesUseCase(c.get<MessageRepository>()),
//   );
//   container.registerSingleton<SendMessageUseCase>(
//     (c) => SendMessageUseCase(c.get<MessageRepository>()),
//   );

//   // Controllers (factory)
//   container.registerFactory<UserController>(
//     (c) => UserController(fetchUsersUseCase: c.get<FetchUsersUseCase>()),
//   );
//   container.registerFactory<ChatController>(
//     (c) => ChatController(
//       fetchMessagesUseCase: c.get<FetchMessagesUseCase>(),
//       sendMessageUseCase: c.get<SendMessageUseCase>(),
//     ),
//   );

//   // Set the global instance
//   DependencyContainer._instance = container;
// }
// // Usage example
// // void main() {
// //   // Initialize dependencies
// //   initMessenger();  
// //   // Access anywhere in the application
// //   final userController = DependencyContainer.instance.get<UserController>();
// //   final chatController = DependencyContainer.instance.get<ChatController>();
// //   // Use controllers...
// // }