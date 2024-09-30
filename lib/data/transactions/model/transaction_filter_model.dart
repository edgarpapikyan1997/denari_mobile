import 'package:json_annotation/json_annotation.dart';
part 'transaction_filter_model.g.dart';

@JsonSerializable()
class TransactionFilterModel {
  final int? rangeFrom;
  final int? rangeTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String>? storeNames;


  const TransactionFilterModel({
    this.rangeFrom,
    this.rangeTo,
    this.startDate,
     this.endDate,
    this.storeNames,

  });

  factory TransactionFilterModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionFilterModelToJson(this);

TransactionFilterModel copyWith({
    final int? rangeFrom,
    final int? rangeTo,
    final DateTime? startDate,
    final DateTime? endDate,
    final List<String>? storeNames,

  }) {
    return TransactionFilterModel(
      rangeFrom: rangeFrom ?? this.rangeFrom,
      rangeTo: rangeTo ?? this.rangeTo,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      storeNames: storeNames ?? this.storeNames,
    );
  }
}
