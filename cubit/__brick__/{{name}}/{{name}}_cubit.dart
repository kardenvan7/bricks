import 'package:flutter_bloc/flutter_bloc.dart';
{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/use_freezed}}

part '{{name}}_state.dart';
{{#use_freezed}}part '{{name}}_cubit.freezed.dart';{{/use_freezed}}

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(const {{name.pascalCase()}}State.initial());
}

extension {{name.pascalCase()}}StateSwitch on {{name.pascalCase()}}Cubit {
  void _emit({{name.pascalCase()}}State state) {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    emit(state);
  }

  void _emitLoadedState() {
    _emit({{name.pascalCase()}}State.loaded());
  }

  void _emitLoadingState() {
    _emit(const {{name.pascalCase()}}State.loading());
  }

  void _emitErrorState() {
    _emit({{name.pascalCase()}}State.error());
  }
}
