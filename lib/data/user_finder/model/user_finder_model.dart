import 'package:json_annotation/json_annotation.dart';

part 'user_finder_model.g.dart';

@JsonSerializable()
class UserFinder {
  @JsonKey(defaultValue: '',)
  final String contactInfo;

  const UserFinder({
    required this.contactInfo,

  });

  factory UserFinder.fromJson(Map<String, dynamic> json) =>
      _$UserFinderFromJson(json);

  Map<String, dynamic> toJson() => _$UserFinderToJson(this);

  UserFinder copyWith({
    String? contactInfo,

  }) {
    return UserFinder(
      contactInfo: contactInfo ?? this.contactInfo,
    );
  }
}
