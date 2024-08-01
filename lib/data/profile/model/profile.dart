import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
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

  const Profile({
    required this.id,
    required this.phone,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.createdAt,
    required this.code,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    String? id,
    String? phone,
    String? email,
    String? name,
    String? dateOfBirth,
    String? createdAt,
    String? code,
  }) {
    return Profile(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
      code: code ?? this.code,
    );
  }
}
