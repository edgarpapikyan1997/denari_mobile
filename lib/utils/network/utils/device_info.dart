import 'dart:io';

import 'package:denari_app/utils/network/model/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<DeviceInfo> getDeviceInfo() async {
  String manufacturer;
  String model;
  String osName;
  String osVersion;
  String identifier;
  final deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    manufacturer = androidInfo.manufacturer;
    model = androidInfo.model;
    osName = 'Android';
    osVersion = androidInfo.version.release;
    //UUID for Android
    identifier = androidInfo.id;
  } else {
    final iosInfo = await deviceInfoPlugin.iosInfo;
    manufacturer = 'Apple';
    model = iosInfo.model;
    osName = 'iOS';
    osVersion = iosInfo.systemVersion;
    //UUID for iOS
    identifier = iosInfo.identifierForVendor ?? '';
  }
  return DeviceInfo(
    manufacturer: manufacturer,
    model: model,
    osName: osName,
    osVersion: osVersion,
    identifier: identifier,
  );
}