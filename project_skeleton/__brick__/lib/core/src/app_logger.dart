import 'package:logger/logger.dart';

class AppLogger {
  AppLogger();

  final Logger _logger = Logger();

  void debug(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, error, stackTrace);
  }

  void warning(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, error, stackTrace);
  }

  void info(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, error, stackTrace);
  }

  void verbose(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.v(message, error, stackTrace);
  }

  void wtf(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.wtf(message, error, stackTrace);
  }

  void error(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, error, stackTrace);
  }
}
