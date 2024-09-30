import 'package:json_annotation/json_annotation.dart';

part 'reg_model.g.dart';

@JsonSerializable()
class RegModel {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String? email;
  @JsonKey(defaultValue: '')
  final String password;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String code;

  const RegModel({
    required this.name,
     this.email,
    required this.password,
    required this.phone,
    required this.code,
  });

  factory RegModel.fromJson(Map<String, dynamic> json) =>
      _$RegModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegModelToJson(this);

  RegModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? code,
  }) {
    return RegModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      code: code ?? this.code,
    );
  }
}
