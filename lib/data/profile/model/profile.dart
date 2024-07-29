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
  @JsonKey(defaultValue: false, includeToJson: false)
  final bool isVerified;
  @JsonKey(defaultValue: '')
  final String userName;
  @JsonKey(defaultValue: '')
  final String dateOfBirth;
  @JsonKey(defaultValue: '', includeToJson: false)
  final String createdAt;

  const Profile({
    required this.id,
    required this.phone,
    required this.email,
    required this.isVerified,
    required this.userName,
    required this.dateOfBirth,
    required this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    String? id,
    String? phone,
    String? email,
    bool? isVerified,
    String? userName,
    String? dateOfBirth,
    String? createdAt,
  }) {
    return Profile(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      userName: userName ?? this.userName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
