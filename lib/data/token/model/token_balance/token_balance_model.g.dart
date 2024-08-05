// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenBalanceModel _$TokenBalanceModelFromJson(Map<String, dynamic> json) =>
    TokenBalanceModel(
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      totalBalance: (json['totalBalance'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TokenBalanceModelToJson(TokenBalanceModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalBalance': instance.totalBalance,
    };
