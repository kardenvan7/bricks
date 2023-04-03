import 'package:flutter/material.dart';
import 'package:{{name}}/di/di.dart';
import 'package:{{name}}/features/app/presentation/{{name}}.dart';

void main() {
  AppInitializer().initialize();
}

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _initDependencyInjection();

    // runApp(const {{name.pascalCase()}}());
  }

  /// Initializes dependency injection classes for all scopes.
  ///
  /// Initializes dependency injection scopes.
  ///
  Future<void> _initDependencyInjection() async {
    final initializer = DependencyInjectionInitializer();

    await initializer.initializeScopes();
  }
}
