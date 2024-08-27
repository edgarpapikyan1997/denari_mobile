import 'package:json_annotation/json_annotation.dart';
part 'gift_card_model.g.dart';


@JsonSerializable()
class GiftCardModel {
  @JsonKey(defaultValue: '', includeToJson: false, name: 'UniqueID')
  final String uniqueID;
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '')
  final String shopId;

  const GiftCardModel({
    required this.uniqueID,
    required this.value,
    required this.shopId,

  });

  factory GiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardModelToJson(this);

  GiftCardModel copyWith({
    String? uniqueID,
    int? value,
    String? shopId,
  }) {
    return GiftCardModel(
      uniqueID: uniqueID ?? this.uniqueID,
      value: value ?? this.value,
      shopId: shopId ?? this.shopId
    );
  }
}
