import 'package:skelete_test/di/di.dart';
import 'package:skelete_test/features/app/app_scope.dart';

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
