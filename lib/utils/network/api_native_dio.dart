import 'package:dio/io.dart';

import 'data/token_preferences.dart';
import 'interceptors/interceptors.dart';

class ApiNativeDio extends DioForNative {
  ApiNativeDio(TokenPreferences preferencesRepository) : super() {
    interceptors.addAll(Interceptors(preferencesRepository).interceptors);
  }
}
