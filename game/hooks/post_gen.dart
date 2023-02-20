import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Post generation initiated');

  context.logger.info('Fetching dependencies');

  await Process.run('flutter', ['pub', 'get']);
  await Process.run('dart', ['fix', '--apply']);

  progress.complete('Post generation finished successfully');
}
