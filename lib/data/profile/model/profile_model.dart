import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(defaultValue: '', includeToJson: false)
  final String id;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String dateOfBirth;
  @JsonKey(defaultValue: '', includeToJson: false)
  final String createdAt;
  @JsonKey(defaultValue: '')
  final String code;
  @JsonKey(defaultValue: false)
  final bool allowGPSLocation;
  @JsonKey(defaultValue: false)
  final bool transactionNotification;
  @JsonKey(defaultValue: false)
  final bool advertisements;

  const ProfileModel({
    required this.id,
    required this.phone,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.createdAt,
    required this.code,
    required this.allowGPSLocation,
    required this.transactionNotification,
    required this.advertisements,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  ProfileModel copyWith({
    String? id,
    String? phone,
    String? email,
    String? name,
    String? dateOfBirth,
    String? createdAt,
    String? code,
    bool? allowGPSLocation,
    bool? transactionNotification,
    bool? advertisements,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
      code: code ?? this.code,
      allowGPSLocation: allowGPSLocation ?? this.allowGPSLocation,
      transactionNotification: transactionNotification ?? this.transactionNotification,
      advertisements: advertisements ?? this.advertisements,
    );
  }
}
