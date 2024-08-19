import 'package:json_annotation/json_annotation.dart';
part 'shops_model.g.dart';

// "id": "004f07a4-7ebe-4331-88eb-3f9e7d41585a",
// "name": "TestShop1",
// "cashback": 20,
// "inviteCode": null,
// "imageUrl": "https://trikky.ru/wp-content/blogs.dir/1/files/2023/03/23/zyro-image-11.jpg",
// "totalTokensGiven": "3000",
// "totalTransactions": "6",
// "createdAt": "2024-08-05T05:34:01.214Z",

@JsonSerializable()
class ShopsModel {
  @JsonKey(defaultValue: '', includeToJson: false)
  final String id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: 0)
  final int cashback;
  @JsonKey(defaultValue: '')
  final String? inviteCode;
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: '')
  final String totalTokensGiven;
  @JsonKey(defaultValue: '')
  final String totalTransactions;
  @JsonKey(defaultValue: '')
  final String createdAt;

  const ShopsModel({
    required this.id,
    required this.name,
    required this.cashback,
    this.inviteCode,
    required this.imageUrl,
    required this.totalTokensGiven,
    required this.totalTransactions,
    required this.createdAt,
  });

  factory ShopsModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsModelToJson(this);

  ShopsModel copyWith({
    String? id,
    String? name,
    int? cashback,
    String? inviteCode,
    String? imageUrl,
    String? totalTokensGiven,
    String? totalTransactions,
    String? createdAt,
  }) {
    return ShopsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        cashback: cashback ?? this.cashback,
        inviteCode: inviteCode ?? this.inviteCode,
        imageUrl: imageUrl ?? this.imageUrl,
        totalTokensGiven: totalTokensGiven ?? this.totalTokensGiven,
        totalTransactions: totalTransactions ?? this.totalTransactions,
        createdAt: createdAt ?? this.createdAt);
  }
}
