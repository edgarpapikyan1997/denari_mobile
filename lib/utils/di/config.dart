import 'package:denari_app/data/advertisements/repository/impl/advertisements_repository.dart';
import 'package:denari_app/data/authentication/repository/impl/auth_repository.dart';
import 'package:denari_app/data/notifications/repository/impl/firebase_messages_repository.dart';
import 'package:denari_app/data/profile/repository/impl/profile_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/api_native_dio.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:dio/dio.dart';

import '../../data/token/repository/impl/token_repository_impl.dart';
import 'di.dart';

final di = Di();

configDi(Config config) {
  di.add(config);
  di.add(ApiTokenPreferences());
  di.add(ApiNativeDio(di.get<TokenPreferences>()));
  di.add(ImplAuthRepository(client: di.get<Dio>(), config: di.get<Config>()));
  di.add(ImplTokenRepository(client: di.get<Dio>(), config: di.get<Config>()));
  di.add(ImplProfileRepository(client: di.get<Dio>(), config: di.get<Config>()));
  di.add(FirebaseMessagesRepository(client: di.get<Dio>(), config: di.get<Config>()));
  di.add(ImplAdvertisementsRepository(client: di.get<Dio>(), config: di.get<Config>()));
}
