import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Post generation initiated');

  context.logger.info('Fetching dependencies');

  await Process.run('flutter', ['pub', 'get']);

  context.logger.info('Running build runner');

  await Process.run(
    'flutter',
    [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
  );

  context.logger.info('Adding fluttergen globally');

  await Process.run(
    'dart',
    ['pub', 'global', 'activate', 'flutter_gen'],
  );

  context.logger.info('Running fluttergen');

  await Process.run('fluttergen', []);

  // context.logger.info('Running dart fix');
  //
  // await Process.run('dart', ['fix', '--apply']);

  progress.complete('Post generation finished successfully');
}
