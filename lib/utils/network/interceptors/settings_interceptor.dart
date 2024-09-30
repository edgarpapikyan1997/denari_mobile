import 'dart:async';

import 'package:denari_app/utils/network/model/device_info.dart';
import 'package:denari_app/utils/network/utils/device_info.dart';
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
    return _deviceInfo = await getDeviceInfo();
  }

  FutureOr<String> _getUserAgent() async {
    final packageInfo = await _getPackageInfo();
    final deviceDetails = await _getDeviceInfo();
    return '${packageInfo.appName}/'
        '${packageInfo.version}(${packageInfo.buildNumber})/'
        '${deviceDetails.manufacturer}(${deviceDetails.model})/'
        '${deviceDetails.osName}(${deviceDetails.osVersion})';
  }
}
