import 'dart:io';

import 'package:hooks_utils/re_case.dart';
import 'package:mason/mason.dart';

import 'state_type.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['name'];
  final bool withCommands = context.vars['withCommands'];
  final stateType = StateType.fromString(context.vars['stateType']);

  context.vars['isStateFreezed'] = stateType == StateType.freezed;
  context.vars['isStateSealed'] = stateType == StateType.sealed;

  _setClassNames(
    context,
    name: name,
    stateType: stateType,
    withCommands: withCommands,
  );
  _setFileNames(
    context,
    name: name,
    stateType: stateType,
    withCommands: withCommands,
  );
}

void _setClassNames(
  HookContext context, {
  required String name,
  required StateType stateType,
  required bool withCommands,
}) {
  final baseClassName = ReCase(name).pascalCase;

  context.vars['blocClassName'] = '${baseClassName}Bloc';
  context.vars['eventClassName'] = '${baseClassName}Event';

  final stateClassName = '${baseClassName}State';
  context.vars['stateClassName'] = stateClassName;

  if (withCommands) {
    context.vars['commandClassName'] = '${baseClassName}Command';
  }

  context.vars['initialStateConstructorName'] = switch (stateType) {
    StateType.freezed => '$stateClassName.initial',
    StateType.sealed => '${stateClassName}Initial',
  };
}

void _setFileNames(
  HookContext context, {
  required String name,
  required StateType stateType,
  required bool withCommands,
}) {
  final baseFileName = ReCase(name).snakeCase;

  context.vars['blocFileName'] = '${baseFileName}_bloc';
  context.vars['eventFileName'] = '${baseFileName}_event';

  switch (stateType) {
    case StateType.sealed:
      context.vars['stateFileName'] = '${baseFileName}_state';
      break;
    case StateType.freezed:
      final stateFileName = '${baseFileName}_state.frz';
      context.vars['stateFileName'] = stateFileName;
      context.vars['statePartFileName'] = '$stateFileName.freezed';
      break;
  }

  if (withCommands) {
    context.vars['commandFileName'] = '${baseFileName}_command';
  }
}

class IOOverridesLol extends IOOverrides {}
