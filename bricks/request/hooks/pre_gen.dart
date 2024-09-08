import 'package:hooks_utils/re_case.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'];
  final baseFileName = '${ReCase(name).snakeCase}_request.jsn';

  context.vars['className'] = '${ReCase(name).pascalCase}Request';
  context.vars['fileName'] = baseFileName;
  context.vars['partFileName'] = '$baseFileName.g';
}
