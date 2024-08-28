// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      date: json['date'] as String? ?? '',
      shopId: json['shopId'] as String? ?? '',
      addressShopId: (json['addressShopId'] as num?)?.toInt() ?? 0,
      transactionsAmount: (json['transactionsAmount'] as num?)?.toInt() ?? 0,
      tokenAddedAmount: (json['tokenAddedAmount'] as num?)?.toInt() ?? 0,
      amountTokensUsed: (json['amountTokensUsed'] as num?)?.toInt() ?? 0,
      amountGiftCardsUsing:
          (json['amountGiftCardsUsing'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      giftCardAmount: (json['giftCardAmount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'shopId': instance.shopId,
      'addressShopId': instance.addressShopId,
      'transactionsAmount': instance.transactionsAmount,
      'tokenAddedAmount': instance.tokenAddedAmount,
      'amountTokensUsed': instance.amountTokensUsed,
      'amountGiftCardsUsing': instance.amountGiftCardsUsing,
      'status': instance.status,
      'comment': instance.comment,
      'giftCardAmount': instance.giftCardAmount,
    };
