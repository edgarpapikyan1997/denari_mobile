import 'package:json_annotation/json_annotation.dart';

part 'gift_card_balance_model.g.dart';

@JsonSerializable()
class GiftCardBalanceModel {
  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: "0")
  final String totalBalance;

  const GiftCardBalanceModel({
    required this.userId,
    required this.totalBalance,
  });

  factory GiftCardBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardBalanceModelToJson(this);

  GiftCardBalanceModel copyWith({
    String? userId,
    String? totalBalance,

  }) {
    return GiftCardBalanceModel(
      userId: userId ?? this.userId,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }
}
