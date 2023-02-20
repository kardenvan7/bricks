import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:{{name}}/src/components/{{name}}.dart';

class {{name.pascalCase()}}Widget extends StatefulWidget {
  const {{name.pascalCase()}}Widget({super.key});

  @override
  State<{{name.pascalCase()}}Widget> createState() => _{{name.pascalCase()}}WidgetState();
}

class _{{name.pascalCase()}}WidgetState extends State<{{name.pascalCase()}}Widget> {
  late final {{name.pascalCase()}} _game;

  @override
  void initState() {
    super.initState();
    _game = {{name.pascalCase()}}();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _game);
  }
}
