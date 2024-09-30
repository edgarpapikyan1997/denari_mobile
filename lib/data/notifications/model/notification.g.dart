// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String,
      message: json['message'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      title: json['title'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'createdAt': instance.createdAt,
      'read': instance.read,
    };
