// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      code: json['code'] as String? ?? '',
      allowGPSLocation: json['allowGPSLocation'] as bool? ?? false,
      transactionNotification:
          json['transactionNotification'] as bool? ?? false,
      advertisements: json['advertisements'] as bool? ?? false,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'code': instance.code,
      'allowGPSLocation': instance.allowGPSLocation,
      'transactionNotification': instance.transactionNotification,
      'advertisements': instance.advertisements,
    };
