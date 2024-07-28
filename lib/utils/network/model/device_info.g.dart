// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => DeviceInfo(
      manufacturer: json['manufacturer'] as String? ?? '',
      model: json['model'] as String? ?? '',
      osName: json['osName'] as String? ?? '',
      osVersion: json['osVersion'] as String? ?? '',
      identifier: json['identifier'] as String? ?? '',
    );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'identifier': instance.identifier,
    };
