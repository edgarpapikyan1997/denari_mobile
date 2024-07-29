// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      userName: json['userName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth,
    };
