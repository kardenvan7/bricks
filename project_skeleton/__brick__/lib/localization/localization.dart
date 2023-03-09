import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Class-wrapper for localization. Whenever you need to use localized string
/// in your code, you access it through this class.
///
/// If you have access to context, use static method [of] with context.
///
class AppLocalizationsFacade {
  AppLocalizationsFacade._();

  static final AppLocalizationsFacade _instance = AppLocalizationsFacade._();

  factory AppLocalizationsFacade() {
    return _instance;
  }

  final List<LocalizationsDelegate> delegates = const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  String getAppTitle({Locale? locale}) {
    return '{{name.pascalCase()}}'; // TODO: fix
  }

  final List<Locale> supportedLocales = SupportedLocales.all;
}

class SupportedLocales {
  static const Locale english = Locale('en');
  static const List<Locale> all = [english];
}

extension BuildContextLocalizationExt on BuildContext {
  AppLocalizations get loc => AppLocalizationsFacade.of(this);
}
