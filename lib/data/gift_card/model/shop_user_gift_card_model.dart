import 'package:json_annotation/json_annotation.dart';

part 'shop_user_gift_card_model.g.dart';

@JsonSerializable()
class ShopUserGiftCardModel {
  @JsonKey(defaultValue: '',)
  final String userId;
  @JsonKey(defaultValue: 0)
  final double giftCardBalance;

  const ShopUserGiftCardModel({
    required this.userId,
    required this.giftCardBalance,
  });

  factory ShopUserGiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$ShopUserGiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopUserGiftCardModelToJson(this);

  ShopUserGiftCardModel copyWith({
    String? userId,
    double? giftCardBalance,
  }) {
    return ShopUserGiftCardModel(
      userId: userId ?? this.userId,
      giftCardBalance: giftCardBalance ?? this.giftCardBalance,
    );
  }
}
