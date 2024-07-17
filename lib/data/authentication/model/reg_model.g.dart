// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegModel _$RegModelFromJson(Map<String, dynamic> json) => RegModel(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$RegModelToJson(RegModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'code': instance.code,
    };
