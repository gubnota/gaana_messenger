// lib/di/injector.dart
class Injector {
  Injector._internal();

  static final Injector _instance = Injector._internal();

  factory Injector() => _instance;

  final Map<Type, dynamic> _dependencies = {};

  /// Registers a singleton instance for type T.
  void registerSingleton<T>(T instance) {
    _dependencies[T] = instance;
  }

  /// Registers a factory function for type T.
  void registerFactory<T>(T Function() factory) {
    _dependencies[T] = factory;
  }

  /// Retrieves an instance of type T. If a factory was registered, it calls the factory.
  T get<T>() {
    final dep = _dependencies[T];
    if (dep == null) {
      throw Exception(
        "No dependency found for type $T. Did you forget to register it?",
      );
    }
    if (dep is Function) {
      return dep() as T;
    }
    return dep as T;
  }

  /// Clears all registered dependencies (useful for testing).
  void clear() {
    _dependencies.clear();
  }
}
