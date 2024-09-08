import 'dart:io';

Future<void> dartFormatFile(
  String path, {
  Directory? workingDirectory,
}) =>
    dartFormatFiles([path], workingDirectory: workingDirectory);

Future<void> dartFormatFiles(
  Iterable<String> paths, {
  Directory? workingDirectory,
}) async {
  paths = paths.map((e) => e.endsWith('.dart') ? e : '$e.dart');

  final process = await Process.start(
    'dart',
    ['format', ...paths],
    runInShell: true,
    workingDirectory: workingDirectory?.path,
  );

  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
}
