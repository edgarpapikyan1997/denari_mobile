import 'package:json_annotation/json_annotation.dart';

part 'reset_pass_model.g.dart';

@JsonSerializable()
class ResetPassModel {
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String newPassword;

  const ResetPassModel({
    required this.phone,
    required this.code,
    required this.newPassword,
  });

  factory ResetPassModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPassModelToJson(this);

  ResetPassModel copyWith({
    String? phone,
    String? code,
    String? newPassword,
  }) {
    return ResetPassModel(
      phone: phone ?? this.phone,
      code: code ?? this.code,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
