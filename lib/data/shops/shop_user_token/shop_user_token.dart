import 'package:json_annotation/json_annotation.dart';

part 'shop_user_token.g.dart';


@JsonSerializable()
class ShopUserToken {
  @JsonKey(
    defaultValue: '',
    includeToJson: false,
  )
  final String userId;
  @JsonKey(defaultValue: '')
  final String shopId;
  @JsonKey(defaultValue: 0)
  final int tokenBalance;
  @JsonKey(defaultValue: 0)
  final int giftCardBalance;

  const ShopUserToken({
    required this.userId,
    required this.shopId,
    required this.tokenBalance,
    required this.giftCardBalance,
  });

  factory ShopUserToken.fromJson(Map<String, dynamic> json) =>
      _$ShopUserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$ShopUserTokenToJson(this);

  ShopUserToken copyWith({
    String? userId,
    String? shopId,
    int? tokenBalance,
    int? giftCardBalance,
  }) {
    return ShopUserToken(
        userId: userId ?? this.userId,
        shopId: shopId ?? this.shopId,
        tokenBalance: tokenBalance ?? this.tokenBalance,
        giftCardBalance: giftCardBalance ?? this.giftCardBalance);
  }
}
