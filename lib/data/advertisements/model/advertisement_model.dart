import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey(defaultValue: '')
  final String imageUrl;
  @JsonKey(defaultValue: '')
  final String siteUrl;

  const AdvertisementModel({
    required this.id,
    required this.imageUrl,
    required this.siteUrl,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);

  AdvertisementModel copyWith({
    String? id,
    String? imageUrl,
    String? siteUrl,
  }) {
    return AdvertisementModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      siteUrl: siteUrl ?? this.siteUrl,
    );
  }
}
