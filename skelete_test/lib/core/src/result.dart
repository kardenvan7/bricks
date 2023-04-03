/// Class for wrapping result of a function so it can return 2 values.
///
/// Commonly used to get rid of try..catch clauses and return either failure
/// object or success object (or null if no object return needed)
///
/// In functions/methods where you need to return Result object use:
///
/// [Result.success] factory if function/method was successfully completed and
/// return value inside this constructor.
///
/// [Result.failure] factory if function/method has ended with failure. You can
/// pass failure object into this constructor to distinct error type in
/// outer functions/methods.
///
/// In functions/methods where you receive [Result] object use [fold] method
/// to define behaviours depending on the returned object (which might be
/// either [_Failure] or [_Success])
///
abstract class Result<F extends Object?, V extends Object?> extends Object {
  const Result();

  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  });

  factory Result.success(V value) => _Success(value);
  factory Result.failure(
    F failure, {
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      _Failure(
        failure,
        error: error,
        stackTrace: stackTrace,
      );
}

class _Success<F, V> extends Result<F, V> {
  const _Success(this.value);

  final V value;

  @override
  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  }) {
    return onSuccess(value);
  }
}

class _Failure<F, V> extends Result<F, V> {
  _Failure(
    this.failure, {
    this.error,
    this.stackTrace,
  });

  final F failure;
  final dynamic error;
  final StackTrace? stackTrace;

  @override
  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  }) {
    return onFailure(failure);
  }
}
