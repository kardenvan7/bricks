import 'package:flutter/foundation.dart';

abstract class ConfigurationVariables {
  /// Fakes internet connection absence
  abstract final ValueNotifier<bool> fakeInternetConnectionAbsence;
  void setFakeInternetConnectionAbsence(bool value) {
    fakeInternetConnectionAbsence.value = value;
  }
}

class DebugConfigurationVariables extends ConfigurationVariables {
  @override
  final ValueNotifier<bool> fakeInternetConnectionAbsence =
      ValueNotifier<bool>(false);
}
