// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopUserToken _$ShopUserTokenFromJson(Map<String, dynamic> json) =>
    ShopUserToken(
      userId: json['userId'] as String? ?? '',
      tokenBalance: (json['tokenBalance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ShopUserTokenToJson(ShopUserToken instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tokenBalance': instance.tokenBalance,
    };
