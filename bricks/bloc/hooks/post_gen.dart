import 'dart:io';

import 'package:hooks_utils/dart_fix.dart';
import 'package:hooks_utils/dart_format.dart';
import 'package:hooks_utils/re_case.dart';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final List<String> files = _getGeneratedFilePaths(context);

  late Directory workingDir;

  final bool createFolder = context.vars['createFolder'];

  if (createFolder) {
    final dirName = ReCase(context.vars['name']).snakeCase;
    final dir = await _createDirectoryAndMoveFiles(dirName, files);
    workingDir = dir;
  } else {
    workingDir = Directory.current;
  }

  await dartFormatFiles(files, workingDirectory: workingDir);
  await dartFix(
    codes: [
      'always_use_package_imports',
      'avoid_relative_lib_imports',
    ],
    workingDirectory: workingDir,
  );
}

List<String> _getGeneratedFilePaths(HookContext context) {
  final List<String> files = [];

  void addToFiles(String fileName) {
    files.add('$fileName.dart');
  }

  addToFiles(context.vars['blocFileName']);
  addToFiles(context.vars['eventFileName']);
  addToFiles(context.vars['stateFileName']);

  final bool withCommands = context.vars['withCommands'];

  if (withCommands) {
    addToFiles(context.vars['commandFileName']);
  }

  return files;
}

Future<Directory> _createDirectoryAndMoveFiles(
  String dirName,
  List<String> files,
) async {
  final dirPath = '${Directory.current.path}/${ReCase(dirName).snakeCase}';
  final dir = await Directory.fromUri(Uri.directory(dirPath)).create();

  final moveProcess = await Process.start('mv', [...files, dir.path]);

  await stdout.addStream(moveProcess.stdout);
  await stderr.addStream(moveProcess.stderr);

  return dir;
}
