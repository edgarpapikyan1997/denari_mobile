import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(defaultValue: '')
  final String date;
  @JsonKey(defaultValue: '')
  final String shopId;
  @JsonKey(defaultValue: 0)
  final int? addressShopId;
  @JsonKey(defaultValue: 0)
  final int? transactionsAmount;
  @JsonKey(defaultValue: 0)
  final int? tokenAddedAmount;
  @JsonKey(defaultValue: 0)
  final int? amountTokensUsed;
  @JsonKey(defaultValue: 0)
  final int? amountGiftCardsUsing;
  @JsonKey(defaultValue: '')
  final String status;
  @JsonKey(defaultValue: '')
  final String? comment;
  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: 0)
  final int? giftCardAmount;

  const TransactionModel({
    required this.date,
    required this.shopId,
     this.addressShopId,
     this.transactionsAmount,
     this.tokenAddedAmount,
     this.amountTokensUsed,
     this.amountGiftCardsUsing,
    required this.status,
     this.comment,
    required this.userId,
    this.giftCardAmount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith({
    final String? date,
    final String? shopId,
    final int? addressShopId,
    final int? transactionsAmount,
    final int? tokenAddedAmount,
    final int? amountTokensUsed,
    final int? amountGiftCardsUsing,
    final String? status,
    final String? comment,
    final String? userId,
    final int? giftCardAmount,
  }) {
    return TransactionModel(
      date: date ?? this.date,
      shopId: shopId ?? this.shopId,
      addressShopId: addressShopId ?? this.addressShopId,
      transactionsAmount: transactionsAmount ?? this.transactionsAmount,
      tokenAddedAmount: tokenAddedAmount ?? this.tokenAddedAmount,
      amountTokensUsed: amountTokensUsed ?? this.amountTokensUsed,
      amountGiftCardsUsing: amountGiftCardsUsing ?? this.amountGiftCardsUsing,
      status: status ?? this.status,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      giftCardAmount: giftCardAmount ?? this.giftCardAmount,
    );
  }
}
