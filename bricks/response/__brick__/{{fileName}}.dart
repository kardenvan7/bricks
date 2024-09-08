import 'package:json_annotation/json_annotation.dart';

part '{{partFileName}}.dart';

@JsonSerializable(createToJson: false)
class {{className}} {
  const {{className}}();

  @override
  factory {{className}}.fromJson(Map<String, dynamic> json) => _${{className}}FromJson(json);
}