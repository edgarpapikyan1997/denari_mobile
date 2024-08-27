// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCardModel _$GiftCardModelFromJson(Map<String, dynamic> json) =>
    GiftCardModel(
      uniqueID: json['UniqueID'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
      shopId: json['shopId'] as String? ?? '',
    );

Map<String, dynamic> _$GiftCardModelToJson(GiftCardModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'shopId': instance.shopId,
    };
