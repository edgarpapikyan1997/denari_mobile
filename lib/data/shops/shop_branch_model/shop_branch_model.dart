import 'package:json_annotation/json_annotation.dart';
part 'shop_branch_model.g.dart';

@JsonSerializable()
class ShopsBranchModel {
  @JsonKey(defaultValue: 0, includeToJson: false)
  final int id;
  @JsonKey(defaultValue: '')
  final String street;
  @JsonKey(defaultValue: '')
  final String city;
  @JsonKey(defaultValue: '')
  final String shopId;
  @JsonKey(defaultValue: '')
  final String openTime;
  @JsonKey(defaultValue: '')
  final String closedTime;
  @JsonKey(defaultValue: '')
  final String phone;

  const ShopsBranchModel({
    required this.id,
    required this.street,
    required this.city,
    required this.shopId,
    required this.openTime,
    required this.closedTime,
    required this.phone,
  });

  factory ShopsBranchModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsBranchModelToJson(this);

  ShopsBranchModel copyWith({
    int? id,
    String? street,
    String? city,
    String? shopId,
    String? openTime,
    String? closedTime,
    String? phone,
  }) {
    return ShopsBranchModel(
      id: id ?? this.id,
      street: street ?? this.street,
      city: city ?? this.city,
      shopId: shopId ?? this.shopId,
      openTime: openTime ?? this.openTime,
      closedTime: closedTime ?? this.closedTime,
      phone: phone ?? this.closedTime,
    );
  }
}
