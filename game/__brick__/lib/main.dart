import 'package:flutter/material.dart';
import 'package:{{name}}/src/di/di.dart';
import 'package:{{name}}/src/widgets/{{name}}_widget.dart';

void main() async {
  await DI.configure();

  runApp(const {{name.pascalCase()}}Widget());
}
