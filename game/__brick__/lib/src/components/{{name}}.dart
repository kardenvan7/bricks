import 'dart:async';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:{{name}}/src/config/constants.dart';

class {{name.pascalCase()}} extends FlameGame with HasCollisionDetection, HasTappables {
  @override
  final bool debugMode = ConfigConstants.debugModeOn;

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
  }
}
