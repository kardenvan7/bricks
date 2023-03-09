import 'package:{{name}}/core/core.dart';
import 'package:{{name}}/features/app/domain/repositories_interfaces/theme_mode_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit({
    required ThemeModeRepository repository,
  })  : _repository = repository,
        super(ThemeMode.dark);

  final ThemeModeRepository _repository;

  Future<void> setSavedThemeMode() async {
    final fetchResult = await _getSavedMode();

    _handleSavedModeFetchResult(fetchResult);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final saveResult = await _saveMode(mode);

    _handleSaveModeResult(saveResult);
  }

  Future<Result<FetchFailure, void>> _saveMode(ThemeMode mode) {
    return _repository.saveThemeMode(mode);
  }

  Future<Result<FetchFailure, ThemeMode>> _getSavedMode() {
    return _repository.getThemeMode();
  }

  void _handleSaveModeResult(Result<FetchFailure, void> result) {
    result.fold(
      onFailure: _onSaveModeFailure,
      onSuccess: (_) => _onSaveModeSuccess(),
    );
  }

  void _handleSavedModeFetchResult(Result<FetchFailure, ThemeMode> result) {
    result.fold(
      onFailure: _onSavedModeFetchFailure,
      onSuccess: _onSavedModeFetchSuccess,
    );
  }

  void _onSavedModeFetchSuccess(ThemeMode mode) {
    emit(mode);
  }

  void _onSaveModeFailure(FetchFailure f) {
    // do nothing
  }

  void _onSaveModeSuccess() {
    // do nothing
  }

  void _onSavedModeFetchFailure(FetchFailure f) {
    // do nothing
  }
}
