part of 'hive_facade.dart';

abstract class HiveBoxFacade<T> {
  const HiveBoxFacade();

  Type get valueType => T;

  Result<LocalFetchFailure, T> read(String key);

  Future<Result<UnknownLocalFetchFailure, void>> save(String key, T value);

  Future<Result<UnknownLocalFetchFailure, void>> delete(String key);
}

class HiveBoxFacadeImpl<T> extends HiveBoxFacade<T> {
  const HiveBoxFacadeImpl(this.box);

  final Box<T> box;

  @override
  Result<LocalFetchFailure, T> read(String key) {
    try {
      final value = box.get(key);

      if (value == null) {
        return Result.failure(const LocalFetchFailure.notFound());
      }

      return Result.success(value);
    } on Exception catch (e, st) {
      return Result.failure(
        LocalFetchFailure.unknown(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }

  @override
  Future<Result<UnknownLocalFetchFailure, void>> save(
    String key,
    T value,
  ) async {
    try {
      await box.put(key, value);

      return Result.success(null);
    } on Exception catch (e, st) {
      return Result.failure(
        UnknownLocalFetchFailure(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }

  @override
  Future<Result<UnknownLocalFetchFailure, void>> delete(String key) async {
    try {
      await box.delete(key);

      return Result.success(null);
    } on Exception catch (e, st) {
      return Result.failure(
        UnknownLocalFetchFailure(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }
}

class MockHiveBoxFacade<T> extends HiveBoxFacade<T> {
  final Map<String, T> _box = {};

  @override
  Result<LocalFetchFailure, T> read(String key) {
    try {
      final value = _box[key];

      if (value == null) {
        return Result.failure(const LocalFetchFailure.notFound());
      }

      return Result.success(value);
    } on Exception catch (e, st) {
      return Result.failure(
        LocalFetchFailure.unknown(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }

  @override
  Future<Result<UnknownLocalFetchFailure, void>> save(
    String key,
    T value,
  ) async {
    try {
      _box[key] = value;

      return Result.success(null);
    } on Exception catch (e, st) {
      return Result.failure(
        UnknownLocalFetchFailure(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }

  @override
  Future<Result<UnknownLocalFetchFailure, void>> delete(String key) async {
    try {
      _box.remove(key);

      return Result.success(null);
    } on Exception catch (e, st) {
      return Result.failure(
        UnknownLocalFetchFailure(
          info: FailureInformation(error: e, trace: st),
        ),
      );
    }
  }
}
