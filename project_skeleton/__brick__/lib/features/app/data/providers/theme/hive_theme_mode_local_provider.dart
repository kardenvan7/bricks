import 'package:{{name}}/core/src/failures/failure.dart';
import 'package:{{name}}/core/src/result.dart';
import 'package:{{name}}/features/app/data/providers/theme/theme_mode_local_provider.dart';
import 'package:{{name}}/hive/hive_facade.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HiveThemeModeLocalProvider implements ThemeModeLocalProvider {
  const HiveThemeModeLocalProvider({
    required HiveBoxFacade<String> hiveBoxFacade,
  }) : _hiveBoxFacade = hiveBoxFacade;

  final HiveBoxFacade<String> _hiveBoxFacade;

  static const String _themeModeKey = 'theme_mode';

  @override
  Future<Result<LocalFetchFailure, ThemeMode>> getThemeMode() {
    final fetchResult = _hiveBoxFacade.read(_themeModeKey);

    return Future.sync(
      () => fetchResult.fold(
        onFailure: (f) => Result.failure(f),
        onSuccess: (value) {
          final mode = _parseModeFromString(value);

          if (mode == null) {
            _hiveBoxFacade.delete(_themeModeKey);
            return Result.failure(const LocalFetchFailure.unknown());
          }

          return Result.success(mode);
        },
      ),
    );
  }

  @override
  Future<Result<LocalFetchFailure, void>> saveThemeMode(ThemeMode mode) async {
    final fetchResult = await _hiveBoxFacade.save(
      _themeModeKey,
      _getStringByMode(mode),
    );

    return fetchResult.fold(
      onFailure: (f) => Result.failure(f),
      onSuccess: Result.success,
    );
  }

  String _getStringByMode(ThemeMode mode) {
    return mode.name;
  }

  ThemeMode? _parseModeFromString(String string) {
    return ThemeMode.values.firstWhereOrNull((e) => e.name == string);
  }
}
