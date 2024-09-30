import 'package:json_annotation/json_annotation.dart';

part 'gift_card_balance_model.g.dart';

@JsonSerializable()
class GiftCardBalanceModel {
  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: 0)
  final int giftCardBalance;

  const GiftCardBalanceModel({
    required this.userId,
    required this.giftCardBalance,
  });

  factory GiftCardBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardBalanceModelToJson(this);

  GiftCardBalanceModel copyWith({
    String? userId,
    int? giftCardBalance,
  }) {
    return GiftCardBalanceModel(
      userId: userId ?? this.userId,
      giftCardBalance: giftCardBalance ?? this.giftCardBalance,
    );
  }
}
