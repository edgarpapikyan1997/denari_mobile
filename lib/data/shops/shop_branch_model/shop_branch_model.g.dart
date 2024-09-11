// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsBranchModel _$ShopsBranchModelFromJson(Map<String, dynamic> json) =>
    ShopsBranchModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      street: json['street'] as String? ?? '',
      city: json['city'] as String? ?? '',
      shopId: json['shopId'] as String? ?? '',
      openTime: json['openTime'] as String? ?? '',
      closedTime: json['closedTime'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );

Map<String, dynamic> _$ShopsBranchModelToJson(ShopsBranchModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'shopId': instance.shopId,
      'openTime': instance.openTime,
      'closedTime': instance.closedTime,
      'phone': instance.phone,
    };
