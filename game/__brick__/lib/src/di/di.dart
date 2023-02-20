import 'package:get_it/get_it.dart';
import 'package:{{name}}/src/core/logger/game_logger.dart';

class DI {
  DI._();

  static final DI _instance = DI._();

  final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _instance._get<T>();
  }

  static Future<void> configure() {
    return _instance._configure();
  }

  T _get<T extends Object>() {
    return _getIt.get<T>();
  }

  Future<void> _configure() async {
    _getIt..registerSingleton<GameLogger>(GameLogger());
    await _getIt.allReady();
  }
}
