import 'package:json_annotation/json_annotation.dart';

part 'device_info.g.dart';

@JsonSerializable()
class DeviceInfo {
  @JsonKey(defaultValue: '')
  final String manufacturer;
  @JsonKey(defaultValue: '')
  final String model;
  @JsonKey(defaultValue: '')
  final String osName;
  @JsonKey(defaultValue: '')
  final String osVersion;
  @JsonKey(defaultValue: '')
  final String identifier;

  DeviceInfo({
    required this.manufacturer,
    required this.model,
    required this.osName,
    required this.osVersion,
    required this.identifier,
  });

  String get info => '$manufacturer, $model, $osName, $osVersion';

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);
}
