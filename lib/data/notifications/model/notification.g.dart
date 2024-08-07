// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String,
      body: json['body'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      title: json['title'] as String? ?? '',
      user: json['user'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'user': instance.user,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'read': instance.read,
    };
