import 'package:json_annotation/json_annotation.dart';

import 'shop_user_token_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(defaultValue: '', name: 'UniqueID')
  final String uniqueId;
  @JsonKey(defaultValue: '')
  final String name;

  final DateTime? openTime;

  final DateTime? closedTime;

  @JsonKey(defaultValue: [])
  final List<ShopUserToken>? shopUserTokens;

  const TokenModel({
    required this.uniqueId,
    required this.name,
    required this.shopUserTokens,
    this.openTime,
    this.closedTime,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  TokenModel copyWith({
    String? uniqueId,
    String? name,
    DateTime? openTime,
    DateTime? closedTime,
    List<ShopUserToken>? shopUserTokens,
  }) {
    return TokenModel(
      uniqueId: uniqueId ?? this.uniqueId,
      name: name ?? this.name,
      openTime: openTime ?? this.openTime,
      closedTime: closedTime ?? this.closedTime,
      shopUserTokens: shopUserTokens ?? this.shopUserTokens,
    );
  }
}
