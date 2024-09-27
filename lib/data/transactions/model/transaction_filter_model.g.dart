// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionFilterModel _$TransactionFilterModelFromJson(
        Map<String, dynamic> json) =>
    TransactionFilterModel(
      rangeFrom: (json['rangeFrom'] as num?)?.toInt(),
      rangeTo: (json['rangeTo'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      storeNames: (json['storeNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TransactionFilterModelToJson(
        TransactionFilterModel instance) =>
    <String, dynamic>{
      'rangeFrom': instance.rangeFrom,
      'rangeTo': instance.rangeTo,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'storeNames': instance.storeNames,
    };
