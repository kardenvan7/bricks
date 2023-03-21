part of '{{name}}_cubit.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();

  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.error() = _Error;
  const factory {{name.pascalCase()}}State.loaded() = _Loaded;

  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isLoaded => this is _Loaded;
}
