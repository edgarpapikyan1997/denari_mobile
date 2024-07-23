import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  @JsonKey(defaultValue: '')
  final String env;
  @JsonKey(defaultValue: '')
  final String host;

  const Config({
    required this.env,
    required this.host,
  });

  factory Config.fromJson(Map<String, dynamic> json) =>
      _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  Config copyWith({
    String? env,
    String? host,
  }) {
    return Config(
      env: env ?? this.env,
      host: host ?? this.host,
    );
  }
}
