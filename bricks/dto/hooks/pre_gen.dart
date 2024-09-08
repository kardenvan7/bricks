import 'package:hooks_utils/re_case.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'];
  final baseFileName = '${ReCase(name).snakeCase}_dto.jsn';

  context.vars['className'] = '${ReCase(name).pascalCase}Dto';
  context.vars['fileName'] = baseFileName;
  context.vars['partFileName'] = '$baseFileName.g';
}
