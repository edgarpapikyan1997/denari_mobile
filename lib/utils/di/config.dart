import 'package:denari_app/data/authentication/repository/impl_auth_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/api_native_dio.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:dio/dio.dart';

import 'di.dart';

final di = Di();

configDi(Config config) {
  di.add(config);
  di.add(ApiTokenPreferences());
  di.add(ApiNativeDio(di.get<ApiTokenPreferences>()!));
  di.add(ImplAuthRepository(client: di.get<Dio>()!, config: di.get<Config>()!));
}
