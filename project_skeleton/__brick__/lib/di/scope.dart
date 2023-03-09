import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

abstract class Scope {
  @protected
  final GetIt getIt = GetIt.asNewInstance();

  Future<void> configure();
}
