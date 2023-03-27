import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_state.dart';
part '{{name}}_cubit.freezed.dart';

abstract class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(const {{name.pascalCase()}}State.initial());
}

extension {{name.pascalCase()}}StateSwitch on {{name.pascalCase()}}Cubit {
  void _emit({{name.pascalCase()}}State state) {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    emit(state);
  }

  @protected
  void setInitialState() {
    _emit(const {{name.pascalCase()}}State.initial());
  }

  @protected
  void setLoadedState() {
    _emit({{name.pascalCase()}}State.loaded());
  }

  @protected
  void setLoadingState() {
    _emit(const {{name.pascalCase()}}State.loading());
  }

  @protected
  void setErrorState() {
    _emit({{name.pascalCase()}}State.error());
  }
}
