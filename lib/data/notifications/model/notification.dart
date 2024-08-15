import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(includeFromJson: true, includeToJson: false)
  final String id;
  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String message;
  @JsonKey(defaultValue: '')
  final String createdAt;
  @JsonKey(defaultValue: false)
  final bool read;

  const Notification({
    required this.id,
    required this.message,
    required this.createdAt,
    required this.read,
    required this.title,
    required this.userId,
  });

  factory Notification.fromObject(Map<Object?, Object?> map) {
    Map<String, dynamic> json = {};
    map.forEach((key, value) {
      json[key.toString()] = value;
    });
    return Notification.fromJson(json);
  }

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  Notification copyWith({
    String? id,
    String? body,
    String? createdAt,
    bool? read,
    String? title,
    String? user,
  }) {
    return Notification(
      id: id ?? this.id,
      message: body ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      read: read ?? this.read,
      title: title ?? this.title,
      userId: user ?? this.userId,
    );
  }

  @override
  String toString() {
    return 'Notification: { '
        'id: $id\n'
        'body: $message\n'
        'createdAt: $createdAt\n'
        'read: $read\n'
        'title: $title\n'
        'user: $userId }\n';
  }
}
