import 'package:flutter/material.dart';
import 'package:skelete_test/di/di.dart';
import 'package:skelete_test/features/app/presentation/skelete_test.dart';

void main() {
  AppInitializer().initialize();
}

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _initDependencyInjection();

    // runApp(const SkeleteTest());
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
