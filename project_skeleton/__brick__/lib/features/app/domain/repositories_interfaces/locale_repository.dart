import 'package:{{name}}/core/core.dart';
import 'package:flutter/material.dart';

abstract class LocaleRepository {
  Future<Result<FetchFailure, Locale>> getLocale();

  Future<Result<FetchFailure, void>> saveLocale(Locale locale);
}
