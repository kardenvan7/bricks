import 'package:envied/envied.dart';

part 'env.g.dart';

abstract class Env {
  abstract final String apiKey;
}

@Envied(path: '.env.dev')
class DevEnv extends Env {
  @override
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  final String apiKey = _DevEnv.apiKey;
}

@Envied(path: '.env.prod')
class ProdEnv extends Env {
  @override
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  final String apiKey = _ProdEnv.apiKey;
}
