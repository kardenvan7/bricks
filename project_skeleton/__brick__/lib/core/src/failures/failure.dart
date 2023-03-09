part 'fetch_failure.dart';

abstract class Failure implements Exception {
  const Failure();
}

class FailureInformation {
  const FailureInformation({
    required this.error,
    required this.trace,
  });

  final Exception error;
  final StackTrace trace;
}
