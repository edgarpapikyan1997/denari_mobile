// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) =>
    AdvertisementModel(
      id: json['id'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      siteUrl: json['siteUrl'] as String? ?? '',
    );

Map<String, dynamic> _$AdvertisementModelToJson(AdvertisementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'siteUrl': instance.siteUrl,
    };
