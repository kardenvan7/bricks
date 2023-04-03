import 'package:{{name}}/di/di.dart';
import 'package:{{name}}/features/app/app_scope.dart';

import 'scope.dart';

class DependencyInjectionInitializer {
  final List<Scope> _scopes = [
    AppScope.instance,
  ];

  Future<void> initializeScopes() async {
    for (final scope in _scopes) {
      await scope.configure();
    }
  }
}
