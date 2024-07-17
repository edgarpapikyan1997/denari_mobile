// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      env: json['env'] as String? ?? '',
      host: json['host'] as String? ?? '',
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'env': instance.env,
      'host': instance.host,
    };
