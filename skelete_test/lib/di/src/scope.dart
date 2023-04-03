import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

abstract class Scope {
  Future<void> configure();
}

abstract class GetItScope extends Scope {
  @protected
  final GetIt getIt = GetIt.asNewInstance();
}
