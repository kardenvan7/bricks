import 'package:skelete_test/core/core.dart';
import 'package:flutter/material.dart';

abstract class LocaleLocalProvider {
  Future<Result<LocalFetchFailure, Locale>> getLocale();
  Future<Result<LocalFetchFailure, void>> saveLocale(Locale locale);
}
