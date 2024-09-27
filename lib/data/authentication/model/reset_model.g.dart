// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetModel _$ResetModelFromJson(Map<String, dynamic> json) => ResetModel(
      phone: json['phone'] as String? ?? '',
      code: json['code'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
    );

Map<String, dynamic> _$ResetModelToJson(ResetModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'newPassword': instance.newPassword,
    };
