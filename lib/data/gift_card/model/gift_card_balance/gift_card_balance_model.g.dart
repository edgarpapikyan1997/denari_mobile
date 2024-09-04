// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCardBalanceModel _$GiftCardBalanceModelFromJson(
        Map<String, dynamic> json) =>
    GiftCardBalanceModel(
      userId: json['userId'] as String? ?? '',
      totalBalance: json['totalBalance'] as String? ?? '0',
    );

Map<String, dynamic> _$GiftCardBalanceModelToJson(
        GiftCardBalanceModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalBalance': instance.totalBalance,
    };
