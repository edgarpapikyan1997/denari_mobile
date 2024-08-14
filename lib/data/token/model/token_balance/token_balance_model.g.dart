// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenBalanceModel _$TokenBalanceModelFromJson(Map<String, dynamic> json) =>
    TokenBalanceModel(
      userId: json['userId'] as String? ?? '',
      totalBalance: json['totalBalance'] as String? ?? '',
    );

Map<String, dynamic> _$TokenBalanceModelToJson(TokenBalanceModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalBalance': instance.totalBalance,
    };
