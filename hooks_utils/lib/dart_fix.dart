import 'dart:io';

Future<void> dartFix({
  String? file,
  Iterable<String> codes = const [],
  Directory? workingDirectory,
}) async {
  if (file != null && !file.endsWith('.dart')) {
    file = '$file.dart';
  }

  String? codeArg;

  if (codes.isNotEmpty) {
    codeArg = '--code=${codes.join(',')}';
  }

  final process = await Process.start(
    'dart',
    [
      'fix',
      '--apply',
      if (codeArg != null) codeArg,
      if (file != null) file,
    ],
    runInShell: true,
    workingDirectory: workingDirectory?.path,
  );

  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
}
