import 'package:json_annotation/json_annotation.dart';

part 'shop_user_token_model.g.dart';

@JsonSerializable()
class ShopUserToken {
  @JsonKey(defaultValue: '',)
  final String userId;
  @JsonKey(defaultValue: 0)
  final double tokenBalance;

  const ShopUserToken({
    required this.userId,
    required this.tokenBalance,
  });

  factory ShopUserToken.fromJson(Map<String, dynamic> json) =>
      _$ShopUserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$ShopUserTokenToJson(this);

  ShopUserToken copyWith({
    String? userId,
    double? tokenBalance,
  }) {
    return ShopUserToken(
      userId: userId ?? this.userId,
      tokenBalance: tokenBalance ?? this.tokenBalance,
    );
  }
}
