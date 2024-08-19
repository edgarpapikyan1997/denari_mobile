// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsModel _$ShopsModelFromJson(Map<String, dynamic> json) => ShopsModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      cashback: (json['cashback'] as num?)?.toInt() ?? 0,
      inviteCode: json['inviteCode'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      totalTokensGiven: json['totalTokensGiven'] as String? ?? '',
      totalTransactions: json['totalTransactions'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$ShopsModelToJson(ShopsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cashback': instance.cashback,
      'inviteCode': instance.inviteCode,
      'imageUrl': instance.imageUrl,
      'totalTokensGiven': instance.totalTokensGiven,
      'totalTransactions': instance.totalTransactions,
      'createdAt': instance.createdAt,
    };
