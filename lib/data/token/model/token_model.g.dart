// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      uniqueId: json['UniqueID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      shopUserTokens: (json['shopUserTokens'] as List<dynamic>?)
              ?.map((e) => ShopUserToken.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      openTime: json['openTime'] == null
          ? null
          : DateTime.parse(json['openTime'] as String),
      closedTime: json['closedTime'] == null
          ? null
          : DateTime.parse(json['closedTime'] as String),
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'UniqueID': instance.uniqueId,
      'name': instance.name,
      'openTime': instance.openTime?.toIso8601String(),
      'closedTime': instance.closedTime?.toIso8601String(),
      'shopUserTokens': instance.shopUserTokens,
    };
