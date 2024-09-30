// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopUserToken _$ShopUserTokenFromJson(Map<String, dynamic> json) =>
    ShopUserToken(
      userId: json['userId'] as String? ?? '',
      shopId: json['shopId'] as String? ?? '',
      tokenBalance: (json['tokenBalance'] as num?)?.toInt() ?? 0,
      giftCardBalance: (json['giftCardBalance'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ShopUserTokenToJson(ShopUserToken instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'tokenBalance': instance.tokenBalance,
      'giftCardBalance': instance.giftCardBalance,
    };
