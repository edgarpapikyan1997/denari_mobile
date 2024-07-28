import 'package:json_annotation/json_annotation.dart';

part 'reset_model.g.dart';

@JsonSerializable()
class ResetModel {
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: '')
  final String newPassword;

  const ResetModel({
    required this.phone,
    required this.code,
    required this.newPassword,
  });

  factory ResetModel.fromJson(Map<String, dynamic> json) =>
      _$ResetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetModelToJson(this);

  ResetModel copyWith({
    String? phone,
    String? code,
    String? newPassword,
  }) {
    return ResetModel(
      phone: phone ?? this.phone,
      code: code ?? this.code,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
