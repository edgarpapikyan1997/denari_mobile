import 'package:denari_app/data/gift_card_model/gift_card_model.dart';
import 'package:denari_app/data/shops/shop_user_token/shop_user_token.dart';
import 'package:json_annotation/json_annotation.dart';
import '../shop_branch_model/shop_branch_model.dart';

part 'shop_unit_model.g.dart';

/*
 "UniqueID": "85058c82-3fd6-4d3c-9579-34ce574560b7",
  "name": "TestShop6",
  "imageUrl": "https://trikky.ru/wp-content/blogs.dir/1/files/2023/03/23/64356786be3b154b36dd9c03ead497de.jpg",
  "description": "",
  "cashback": 3,
 */

@JsonSerializable()
class ShopsUnitModel {
  @JsonKey(
    name: 'UniqueID',
    defaultValue: '',
    includeToJson: false,
  )
  final String uniqueID;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: 0)
  final int cashback;
  @JsonKey(defaultValue: [])
  final List<ShopsBranchModel> branch;
  @JsonKey(defaultValue: [])
  final List<GiftCardModel> giftCards;
  @JsonKey(defaultValue: [])
  final List<ShopUserToken> shopUserTokens;

  const ShopsUnitModel({
    required this.uniqueID,
    required this.name,
    required this.cashback,
    required this.description,
    required this.imageUrl,
    required this.branch,
    required this.giftCards,
    required this.shopUserTokens,
  });

  factory ShopsUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsUnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsUnitModelToJson(this);

  ShopsUnitModel copyWith({
    String? uniqueID,
    String? name,
    int? cashback,
    String? description,
    String? imageUrl,
    List<ShopsBranchModel>? branch,
    List<GiftCardModel>? giftCards,
    List<ShopUserToken>? shopUserTokens,
  }) {
    return ShopsUnitModel(
      uniqueID: uniqueID ?? this.uniqueID,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      cashback: cashback ?? this.cashback,
      description: description ?? this.description,
      branch: branch ?? this.branch,
      giftCards: giftCards ?? this.giftCards,
      shopUserTokens: shopUserTokens ?? this.shopUserTokens,
    );
  }
}
