import 'package:flutter/material.dart';
import 'package:{{name}}/di/global_scope.dart';
import 'package:{{name}}/features/app/presentation/{{name}}.dart';

void main() {
  AppInitializer().initialize();
}

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initDependencyInjection();

    runApp(const {
      {name.pascalCase()}
    }());
  }

  /// Initializes dependency injection classes for all scopes.
  ///
  Future<void> initDependencyInjection() async {
    await GlobalScope.instance.configure();
  }
}
