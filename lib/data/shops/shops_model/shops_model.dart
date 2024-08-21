import 'package:denari_app/data/gift_card_model/gift_card_model.dart';
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
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: '')
  final String description;

  const ShopsModel(
      {required this.id,
      required this.name,
  required this.imageUrl,
  required this.description
      });

  factory ShopsModel.fromJson(Map<String, dynamic> json) =>
      _$ShopsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsModelToJson(this);

  ShopsModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,

  }) {
    return ShopsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }
}
