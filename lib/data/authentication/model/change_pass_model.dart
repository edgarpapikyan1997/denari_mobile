import 'package:json_annotation/json_annotation.dart';

part 'change_pass_model.g.dart';

@JsonSerializable()
class ChangePassModel {
  @JsonKey(defaultValue: '')
  final String oldPassword;
  @JsonKey(defaultValue: '')
  final String newPassword;

  const ChangePassModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePassModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePassModelToJson(this);

  ChangePassModel copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return ChangePassModel(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
