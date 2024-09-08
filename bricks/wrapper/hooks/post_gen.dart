import 'package:hooks_utils/dart_fix.dart';
import 'package:hooks_utils/dart_format.dart';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final fileName = context.vars['fileName'];
  await dartFormatFile(fileName);
  await dartFix(file: fileName);
}
