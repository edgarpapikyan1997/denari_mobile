import 'package:json_annotation/json_annotation.dart';
part 'gift_card_model.g.dart';


@JsonSerializable()
class ShopGiftCardModel {
  @JsonKey(defaultValue: '', includeToJson: false, name: 'UniqueID')
  final String uniqueID;
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '')
  final String shopId;

  const ShopGiftCardModel({
    required this.uniqueID,
    required this.value,
    required this.shopId,

  });

  factory ShopGiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$ShopGiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopGiftCardModelToJson(this);

  ShopGiftCardModel copyWith({
    String? uniqueID,
    int? value,
    String? shopId,
  }) {
    return ShopGiftCardModel(
      uniqueID: uniqueID ?? this.uniqueID,
      value: value ?? this.value,
      shopId: shopId ?? this.shopId
    );
  }
}
