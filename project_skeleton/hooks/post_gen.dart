import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  Progress progress = context.logger.progress(
    'Fetching dependencies',
  );

  await Process.run('flutter', ['pub', 'get']);

  progress.complete('Dependencies fetched successfully');

  progress = context.logger.progress(
    'Running build_runner',
  );

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

  progress.complete('Build_runner finished successfully');

  progress = context.logger.progress('Adding fluttergen globally');

  await Process.run(
    'dart',
    ['pub', 'global', 'activate', 'flutter_gen'],
  );

  progress.complete('Fluttergen added successfully');

  progress = context.logger.progress('Running fluttergen');

  await Process.run('fluttergen', []);

  // context.logger.info('Running dart fix');
  //
  // await Process.run('dart', ['fix', '--apply']);

  progress.complete('Fluttergen finished successfully');
}
