import 'package:logger/logger.dart';

class GameLogger {
  final Logger _logger = Logger();

  void debug(dynamic message) {
    _logger.d(message);
  }

  void warning(dynamic message) {
    _logger.w(message);
  }
}
