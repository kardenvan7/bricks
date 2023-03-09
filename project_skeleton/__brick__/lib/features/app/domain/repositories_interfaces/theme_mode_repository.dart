import 'package:{{name}}/core/core.dart';
import 'package:flutter/material.dart';

abstract class ThemeModeRepository {
  Future<Result<FetchFailure, ThemeMode>> getThemeMode();

  Future<Result<FetchFailure, void>> saveThemeMode(ThemeMode mode);
}
