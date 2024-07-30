// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'code': instance.code,
    };
