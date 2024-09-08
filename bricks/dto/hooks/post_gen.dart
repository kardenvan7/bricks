import 'package:hooks_utils/dart_format.dart';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) {
  return dartFormatFile(context.vars['fileName']);
}
