part of '{{name}}_cubit.dart';

{{#use_freezed}}@freezed{{/use_freezed}}
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();

  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.loaded() = _Loaded;
  const factory {{name.pascalCase()}}State.error() = _Error;

  bool get isLoading => this is _Loading;
  bool get isLoaded => this is _Loaded;
  bool get isError => this is _Error;
  bool get isInitial => this is _Initial;
}
