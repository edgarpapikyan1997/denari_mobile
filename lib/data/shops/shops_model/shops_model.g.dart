// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsModel _$ShopsModelFromJson(Map<String, dynamic> json) => ShopsModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ShopsModelToJson(ShopsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
