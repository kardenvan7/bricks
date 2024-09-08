import 'package:json_annotation/json_annotation.dart';
import 'package:bricks_expl/src/core/interfaces/serializable.dart';

part '{{partFileName}}.dart';

@JsonSerializable(createFactory: false)
class {{className}} implements Serializable {
  const {{className}}();

  @override
  Map<String, dynamic> toJson() => _${{className}}ToJson(this);
}