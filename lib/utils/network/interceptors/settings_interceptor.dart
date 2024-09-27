import 'dart:async';
import 'dart:io';

import 'package:denari_app/utils/network/model/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsInterceptor extends Interceptor {
  PackageInfo? _packageInfo;
  DeviceInfo? _deviceInfo;

  SettingsInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['User-Agent'] = await _getUserAgent();
    return handler.next(options);
  }

  FutureOr<PackageInfo> _getPackageInfo() async {
    if (_packageInfo != null) {
      return _packageInfo!;
    }
    return _packageInfo = await PackageInfo.fromPlatform();
  }

  FutureOr<DeviceInfo> _getDeviceInfo() async {
    if (_deviceInfo != null) {
      return _deviceInfo!;
    }
    return _deviceInfo = await _getDeviceDetails();
  }

  FutureOr<String> _getUserAgent() async {
    final packageInfo = await _getPackageInfo();
    final deviceDetails = await _getDeviceInfo();
    return '${packageInfo.appName}/'
        '${packageInfo.version}(${packageInfo.buildNumber})/'
        '${deviceDetails.manufacturer}(${deviceDetails.model})/'
        '${deviceDetails.osName}(${deviceDetails.osVersion})';
  }

  Future<DeviceInfo> _getDeviceDetails() async {
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
}
