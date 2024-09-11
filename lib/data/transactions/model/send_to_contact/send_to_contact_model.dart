import 'package:json_annotation/json_annotation.dart';
part 'send_to_contact_model.g.dart';


@JsonSerializable()
class SendToUserModel {
  @JsonKey(defaultValue: '')
  final String recipientIdentifier;
  @JsonKey(defaultValue: 0)
  final int amount;
  @JsonKey(defaultValue: '')
  final String shopId;

  const SendToUserModel({
    required this.recipientIdentifier,
    required this.amount,
    required this.shopId,
  });

  factory SendToUserModel.fromJson(Map<String, dynamic> json) =>
      _$SendToUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendToUserModelToJson(this);

  SendToUserModel copyWith({
    final String? recipientIdentifier,
    final int? amount,
    final String? shopId,
  }) {
    return SendToUserModel(
      recipientIdentifier: recipientIdentifier ?? this.recipientIdentifier,
      amount: amount ?? this.amount,
      shopId: shopId ?? this.shopId,
    );
  }
}
