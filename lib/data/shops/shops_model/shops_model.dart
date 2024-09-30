import 'package:json_annotation/json_annotation.dart';

part 'shops_model.g.dart';

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
      {this.id = '', required this.name, this.imageUrl = '', this.description = ''});

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
