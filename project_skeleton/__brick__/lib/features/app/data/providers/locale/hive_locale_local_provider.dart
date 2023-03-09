import 'package:{{name}}/core/src/failures/failure.dart';
import 'package:{{name}}/core/src/result.dart';
import 'package:{{name}}/features/app/data/providers/locale/locale_local_provider.dart';
import 'package:{{name}}/hive/hive_facade.dart';
import 'package:flutter/material.dart';

class HiveLocaleLocalProvider implements LocaleLocalProvider {
  const HiveLocaleLocalProvider({
    required HiveBoxFacade<String> hiveBoxFacade,
  }) : _hiveBoxFacade = hiveBoxFacade;

  final HiveBoxFacade<String> _hiveBoxFacade;

  static const String _themeModeKey = 'theme_mode';

  @override
  Future<Result<LocalFetchFailure, Locale>> getLocale() {
    final fetchResult = _hiveBoxFacade.read(_themeModeKey);

    return Future.sync(
      () => fetchResult.fold(
        onFailure: (f) => Result.failure(f),
        onSuccess: (value) {
          final mode = _parseLocaleFromString(value);

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
  Future<Result<LocalFetchFailure, void>> saveLocale(Locale locale) async {
    final fetchResult = await _hiveBoxFacade.save(
      _themeModeKey,
      _getStringByLocale(locale),
    );

    return fetchResult.fold(
      onFailure: (f) => Result.failure(f),
      onSuccess: Result.success,
    );
  }

  String _getStringByLocale(Locale locale) {
    return locale.languageCode;
  }

  Locale? _parseLocaleFromString(String string) {
    return Locale.fromSubtags(languageCode: string);
  }
}
