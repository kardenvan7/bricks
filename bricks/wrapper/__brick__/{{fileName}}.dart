import 'package:flutter/material.dart';
import 'package:oomi/src/application/di/di_scope.dart';
{{#isBlocInjectionConstructor}}import 'package:oomi/src/core/bloc/bloc_disposer.dart';{{/isBlocInjectionConstructor}}
{{#isBlocInjectionProvider}}import 'package:flutter_bloc/flutter_bloc.dart';{{/isBlocInjectionProvider}}
{{#isPageOrFlow}}import 'package:auto_route/auto_route.dart';{{/isPageOrFlow}}

{{#isPageOrFlow}}@RoutePage(){{/isPageOrFlow}}
class {{className}} extends StatelessWidget {
  const {{className}}();

  @override
  Widget build(BuildContext context) {
    return DiScope(
      create: () => YourModule(),
      builder: (module) => {{> wrappeeWithBloc }},
    );
  }
}