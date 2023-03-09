import 'package:{{name}}/core/core.dart';
import 'package:{{name}}/features/app/domain/repositories_interfaces/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit({
    required List<Locale> supportedLocales,
    required LocaleRepository repository,
  })  : assert(supportedLocales.isNotEmpty),
        _repository = repository,
        _supportedLocales = supportedLocales,
        super(supportedLocales[0]);

  final List<Locale> _supportedLocales;
  final LocaleRepository _repository;

  Future<void> setSavedLocale() async {
    final fetchResult = await _getSavedLocale();

    _handleSavedLocaleFetchResult(fetchResult);
  }

  Future<void> setLocale(Locale mode) async {
    final saveResult = await _saveLocale(mode);

    _handleSaveLocaleResult(saveResult);
  }

  Future<Result<FetchFailure, void>> _saveLocale(Locale mode) {
    return _repository.saveLocale(mode);
  }

  Future<Result<FetchFailure, Locale>> _getSavedLocale() {
    return _repository.getLocale();
  }

  void _handleSaveLocaleResult(Result<FetchFailure, void> result) {
    result.fold(
      onFailure: _onSaveLocaleFailure,
      onSuccess: (_) => _onSaveLocaleSuccess(),
    );
  }

  void _handleSavedLocaleFetchResult(Result<FetchFailure, Locale> result) {
    result.fold(
      onFailure: _onSavedLocaleFetchFailure,
      onSuccess: _onSavedLocaleFetchSuccess,
    );
  }

  void _onSavedLocaleFetchSuccess(Locale locale) {
    final bool isSupported = _supportedLocales.any(
      (element) => element.languageCode == locale.languageCode,
    );

    if (isSupported) emit(locale);
  }

  void _onSaveLocaleFailure(FetchFailure f) {
    // do nothing
  }

  void _onSaveLocaleSuccess() {
    // do nothing
  }

  void _onSavedLocaleFetchFailure(FetchFailure f) {
    // do nothing
  }
}
