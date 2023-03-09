import 'package:flutter/material.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

class ThemeFacade {
  final ThemeData light = LightAppTheme().data;
  final ThemeData dark = DarkAppTheme().data;
}

abstract class AppTheme {
  abstract final ThemeData data;
}

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  T themeExt<T>() => theme.extension<T>()!;
}
