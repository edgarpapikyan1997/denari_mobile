// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopGiftCardModel _$ShopGiftCardModelFromJson(Map<String, dynamic> json) =>
    ShopGiftCardModel(
      uniqueID: json['UniqueID'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
      shopId: json['shopId'] as String? ?? '',
    );

Map<String, dynamic> _$ShopGiftCardModelToJson(ShopGiftCardModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'shopId': instance.shopId,
    };
