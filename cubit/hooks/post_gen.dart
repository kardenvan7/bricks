import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Post generation running');
  final arguments = context.vars;

  try {
    if (arguments['use_freezed'] == true) {
      await _generateFreezedFiles(context);
    }

    progress.complete('Post generation finished successfully');
  } catch (e, st) {
    progress.fail('Post generation failed: $e\n\n$st');
  }
}

Future<void> _generateFreezedFiles(HookContext context) async {
  context.logger.info('Running build_runner...');

  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
  );
}
