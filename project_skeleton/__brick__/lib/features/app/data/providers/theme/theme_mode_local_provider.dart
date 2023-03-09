import 'package:{{name}}/core/core.dart';
import 'package:flutter/material.dart';

abstract class ThemeModeLocalProvider {
  Future<Result<LocalFetchFailure, ThemeMode>> getThemeMode();
  Future<Result<LocalFetchFailure, void>> saveThemeMode(ThemeMode mode);
}
