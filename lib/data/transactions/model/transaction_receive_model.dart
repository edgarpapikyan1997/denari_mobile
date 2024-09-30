import 'package:json_annotation/json_annotation.dart';
import '../../shops/shop_branch_model/shop_branch_model.dart';
import '../../shops/shops_model/shops_model.dart';

part 'transaction_receive_model.g.dart';

@JsonSerializable()
class TransactionReceiveModel {
  @JsonKey(defaultValue: '')
  final String? id;
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
  final String? userId;
  @JsonKey(defaultValue: 0)
  final int? giftCardAmount;
  @JsonKey(defaultValue: '')
  final String? cashierId;
  @JsonKey(defaultValue: null)
  final ShopsBranchModel? address;
  @JsonKey(defaultValue: null)
  final ShopsModel shop;

  const TransactionReceiveModel({
    this.id,
    required this.date,
    required this.shopId,
    this.addressShopId,
    this.transactionsAmount,
    this.tokenAddedAmount,
    this.amountTokensUsed,
    this.amountGiftCardsUsing,
    required this.status,
    this.comment,
    this.userId,
    this.giftCardAmount,
    this.cashierId,
    this.address,
    required this.shop
  });

  factory TransactionReceiveModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionReceiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReceiveModelToJson(this);

  TransactionReceiveModel copyWith({
    final String? id,
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
    final String? cashierId,
    final ShopsBranchModel? address,
    final ShopsModel? shop,
  }) {
    return TransactionReceiveModel(
      id: id ?? this.id,
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
      cashierId: cashierId ?? this.cashierId,
      address: address ?? this.address,
      shop: shop ?? this.shop,
    );
  }
}
