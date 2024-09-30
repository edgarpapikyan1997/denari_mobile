// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCardModel _$GiftCardModelFromJson(Map<String, dynamic> json) =>
    GiftCardModel(
      uniqueId: json['UniqueID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      shopGiftCardModel: (json['shopUserTokens'] as List<dynamic>?)
              ?.map((e) =>
                  GiftCardBalanceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GiftCardModelToJson(GiftCardModel instance) =>
    <String, dynamic>{
      'UniqueID': instance.uniqueId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'shopUserTokens': instance.shopGiftCardModel,
    };
