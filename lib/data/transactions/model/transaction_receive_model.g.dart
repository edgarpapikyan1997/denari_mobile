// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_receive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionReceiveModel _$TransactionReceiveModelFromJson(
        Map<String, dynamic> json) =>
    TransactionReceiveModel(
      id: json['id'] as String? ?? '',
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
      userId: json['userId'] as String? ?? '',
      giftCardAmount: (json['giftCardAmount'] as num?)?.toInt() ?? 0,
      cashierId: json['cashierId'] as String? ?? '',
      address: json['address'] == null
          ? null
          : ShopsBranchModel.fromJson(json['address'] as Map<String, dynamic>),
      shop: ShopsModel.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionReceiveModelToJson(
        TransactionReceiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'shopId': instance.shopId,
      'addressShopId': instance.addressShopId,
      'transactionsAmount': instance.transactionsAmount,
      'tokenAddedAmount': instance.tokenAddedAmount,
      'amountTokensUsed': instance.amountTokensUsed,
      'amountGiftCardsUsing': instance.amountGiftCardsUsing,
      'status': instance.status,
      'comment': instance.comment,
      'userId': instance.userId,
      'giftCardAmount': instance.giftCardAmount,
      'cashierId': instance.cashierId,
      'address': instance.address,
      'shop': instance.shop,
    };
