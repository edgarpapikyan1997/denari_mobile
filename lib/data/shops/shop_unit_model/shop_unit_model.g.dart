// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopsUnitModel _$ShopsUnitModelFromJson(Map<String, dynamic> json) =>
    ShopsUnitModel(
      uniqueID: json['UniqueID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      cashback: (json['cashback'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      branch: (json['branch'] as List<dynamic>?)
              ?.map((e) => ShopsBranchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      giftCards: (json['giftCards'] as List<dynamic>?)
              ?.map((e) => GiftCardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      shopUserTokens: (json['shopUserTokens'] as List<dynamic>?)
              ?.map((e) => ShopUserToken.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ShopsUnitModelToJson(ShopsUnitModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'cashback': instance.cashback,
      'branch': instance.branch,
      'giftCards': instance.giftCards,
      'shopUserTokens': instance.shopUserTokens,
    };
