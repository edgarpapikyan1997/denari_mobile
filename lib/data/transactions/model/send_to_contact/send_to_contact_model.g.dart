// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_to_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendToUserModel _$SendToUserModelFromJson(Map<String, dynamic> json) =>
    SendToUserModel(
      recipientIdentifier: json['recipientIdentifier'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      shopId: json['shopId'] as String? ?? '',
    );

Map<String, dynamic> _$SendToUserModelToJson(SendToUserModel instance) =>
    <String, dynamic>{
      'recipientIdentifier': instance.recipientIdentifier,
      'amount': instance.amount,
      'shopId': instance.shopId,
    };
