import 'package:denari_app/data/shops/gift_card_model/gift_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gift_card_balance/gift_card_balance_model.dart';

part 'gift_card_model.g.dart';

@JsonSerializable()
class GiftCardModel {
  @JsonKey(defaultValue: '', name: 'UniqueID')
  final String uniqueId;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: [], name: 'shopUserTokens')
  final List<GiftCardBalanceModel>? shopGiftCardModel;

  const GiftCardModel({
    required this.uniqueId,
    required this.name,
    required this.imageUrl,
    required this.shopGiftCardModel,
  });

  factory GiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardModelToJson(this);

  GiftCardModel copyWith({
    String? uniqueId,
    String? name,
    String? imageUrl,
    List<GiftCardBalanceModel>? shopGiftCardModel,
  }) {
    return GiftCardModel(
      uniqueId: uniqueId ?? this.uniqueId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      shopGiftCardModel: shopGiftCardModel ?? this.shopGiftCardModel,
    );
  }
}
