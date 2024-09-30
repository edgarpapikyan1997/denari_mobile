// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPassModel _$ResetPassModelFromJson(Map<String, dynamic> json) =>
    ResetPassModel(
      phone: json['phone'] as String? ?? '',
      code: json['code'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
    );

Map<String, dynamic> _$ResetPassModelToJson(ResetPassModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'newPassword': instance.newPassword,
    };
