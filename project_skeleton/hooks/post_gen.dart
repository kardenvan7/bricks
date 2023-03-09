import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  Progress progress = context.logger.progress(
    'Post generation initiated',
  );

  progress.update('Fetching dependencies');

  await Process.run('flutter', ['pub', 'get']);

  progress.update('Running build runner');

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

  progress.update('Adding fluttergen globally');

  await Process.run(
    'dart',
    ['pub', 'global', 'activate', 'flutter_gen'],
  );

  progress.update('Running fluttergen');

  await Process.run('fluttergen', []);

  // context.logger.info('Running dart fix');
  //
  // await Process.run('dart', ['fix', '--apply']);

  progress.complete('Post generation finished successfully');
}
