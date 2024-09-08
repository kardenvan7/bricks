import 'package:json_annotation/json_annotation.dart';
{{#createToJson}}import 'package:bricks_expl/src/core/interfaces/serializable.dart';{{/createToJson}}

part '{{partFileName}}.dart';

@JsonSerializable()
class {{className}} {{#createToJson}}implements Serializable{{/createToJson}} {
  const {{className}}();

  {{#createFromJson}}
  factory {{className}}.fromJson(Map<String, dynamic> json) => _${{className}}FromJson(json);
  {{/createFromJson}}

  {{#createToJson}}
  @override
  Map<String, dynamic> toJson() => _${{className}}ToJson(this);
  {{/createToJson}}
}