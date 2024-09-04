// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_user_gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopUserGiftCardModel _$ShopUserGiftCardModelFromJson(
        Map<String, dynamic> json) =>
    ShopUserGiftCardModel(
      userId: json['userId'] as String? ?? '',
      giftCardBalance: (json['giftCardBalance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ShopUserGiftCardModelToJson(
        ShopUserGiftCardModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'giftCardBalance': instance.giftCardBalance,
    };
