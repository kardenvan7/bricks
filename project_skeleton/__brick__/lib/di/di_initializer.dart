import 'package:{{name}}/di/global_scope.dart';
import 'package:{{name}}/di/scope.dart';

class DependencyInjectionInitializer {
  final List<Scope> scopes = [
    GlobalScope.instance,
  ];

  Future<void> initializeScopes() async {
    for (final scope in scopes) {
      await scope.configure();
    }
  }
}
