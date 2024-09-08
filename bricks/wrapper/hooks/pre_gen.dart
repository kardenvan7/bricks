import 'package:hooks_utils/re_case.dart';
import 'package:mason/mason.dart';

import 'bloc_injection_type.dart';

void run(HookContext context) {
  final String name = context.vars['name'];
  final wrappeeReCase = ReCase(name);
  final wrappeeClassName = wrappeeReCase.pascalCase;
  final wrappeeFileName = wrappeeReCase.snakeCase;

  final wrapperClassName = '${wrappeeClassName}Wrapper';
  final wrapperFileName = '${wrappeeFileName}_wrapper';

  context.vars['wrappeeClassName'] = wrappeeClassName;
  context.vars['className'] = wrapperClassName;
  context.vars['fileName'] = wrapperFileName;
  context.vars['isPageOrFlow'] =
      RegExp(r'Page|Flow$').hasMatch(wrappeeClassName);
  context.vars['isFlow'] = RegExp(r'Flow$').hasMatch(wrappeeClassName);

  final injectionType =
      BlocInjectionType.fromString(context.vars['blocInjectionType']);

  context.vars['isBlocInjectionProvider'] =
      injectionType == BlocInjectionType.provider;
  context.vars['isBlocInjectionConstructor'] =
      injectionType == BlocInjectionType.constructor;
}
