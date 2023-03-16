import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name}}_state.dart';
part '{{name}}_cubit.freezed.dart';

class {{name.pascalCase()}}CubitImpl extends {{name.pascalCase()}}Cubit {
  {{name.pascalCase()}}CubitImpl();
}

abstract class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(const {{name.pascalCase()}}State.initial());
}

extension {{name.pascalCase()}}StateSwitch on {{name.pascalCase()}}Cubit {
  void _emit({{name.pascalCase()}}State state) {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    emit(state);
  }

  void setLoadedState() {
    _emit({{name.pascalCase()}}State.loaded());
  }

  void setLoadingState() {
    _emit(const {{name.pascalCase()}}State.loading());
  }

  void setErrorState() {
    _emit({{name.pascalCase()}}State.error());
  }
}
