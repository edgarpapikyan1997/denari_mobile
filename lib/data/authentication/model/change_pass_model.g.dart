// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassModel _$ChangePassModelFromJson(Map<String, dynamic> json) =>
    ChangePassModel(
      oldPassword: json['oldPassword'] as String? ?? '',
      newPassword: json['newPassword'] as String? ?? '',
    );

Map<String, dynamic> _$ChangePassModelToJson(ChangePassModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
