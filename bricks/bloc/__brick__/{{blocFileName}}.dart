{{#isStateSealed}}import 'package:equatable/equatable.dart';{{/isStateSealed}}
{{#withCommands}}import 'package:oomi/src/core/bloc/commands_bloc.dart';{{/withCommands}}
{{^withCommands}}import 'package:oomi/src/core/bloc/base_bloc.dart';{{/withCommands}}
{{#isStateFreezed}}
import '{{stateFileName}}.dart';

export '{{stateFileName}}.dart';
{{/isStateFreezed}}

part '{{eventFileName}}.dart';
{{#isStateSealed}}part '{{stateFileName}}.dart';{{/isStateSealed}}
{{#withCommands}}part '{{commandFileName}}.dart';{{/withCommands}}

class {{blocClassName}} extends
  {{#withCommands}}CommandsBloc<{{eventClassName}}, {{stateClassName}}, {{commandClassName}}>{{/withCommands}}
  {{^withCommands}}BaseBloc<{{eventClassName}}, {{stateClassName}}>{{/withCommands}} {
  {{blocClassName}}() : super({{#isStateSealed}}const{{/isStateSealed}} {{initialStateConstructorName}}()) {
    on<{{eventClassName}}>(
      (event, emit) => switch (event) {},
    );
  }
}