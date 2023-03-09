import 'package:{{name}}/config/env.dart';

abstract class ConfigurationVariables {
  ConfigurationVariables({
    required this.environmentalVariables,
  });

  final Env environmentalVariables;

  /// Fakes internet connection absence
  abstract bool fakeInternetConnectionAbsence;
}

class DebugConfigurationVariables extends ConfigurationVariables {
  DebugConfigurationVariables({
    required super.environmentalVariables,
  });

  @override
  bool fakeInternetConnectionAbsence = false;
}
