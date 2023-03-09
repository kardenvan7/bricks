import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  abstract final RouteInformationParser<Object>? routeInformationParser;
  abstract final RouterDelegate<Object>? routerDelegate;
}

class BeamerAppRouter extends AppRouter {
  @override
  final RouteInformationParser<Object>? routeInformationParser = BeamerParser();

  @override
  final RouterDelegate<Object>? routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const Scaffold(),
      },
    ),
  );
}
