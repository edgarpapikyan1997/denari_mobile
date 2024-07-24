import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'error_interceptor.dart';
import 'settings_interceptor.dart';
import 'token_interceptor.dart';

class Interceptors {
  List<Interceptor> interceptors = [];

  Interceptors(TokenPreferences tokenPreferences) {
    interceptors.addAll([
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printResponseHeaders: kDebugMode,
          printRequestHeaders: kDebugMode,
          requestPen: AnsiPen()..rgb(b: 0.0),
          responsePen: AnsiPen()..rgb(r: 0.0, b: 0.0),
        ),
      ),
      SettingsInterceptor(),
      ErrorInterceptor(),
      TokenInterceptor(tokenPreferences),
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          hitCacheOnErrorExcept: [401, 403],
          maxStale: const Duration(days: 3),
          allowPostMethod: true,
        ),
      ),
    ]);
  }
}
