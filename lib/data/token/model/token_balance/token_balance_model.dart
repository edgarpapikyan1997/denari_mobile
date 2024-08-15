import 'package:json_annotation/json_annotation.dart';


part 'token_balance_model.g.dart';

@JsonSerializable()
class TokenBalanceModel {
  @JsonKey(defaultValue: '')
  final String userId;
  @JsonKey(defaultValue: 0)
  final int totalBalance;

  const TokenBalanceModel({
    required this.userId,
    required this.totalBalance,
  });

  factory TokenBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$TokenBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenBalanceModelToJson(this);

  TokenBalanceModel copyWith({
    String? userId,
    int? totalBalance,

  }) {
    return TokenBalanceModel(
      userId: userId ?? this.userId,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }
}
