import 'dart:convert';

import 'package:denari_app/utils/network/model/api_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenPreferences {
  Future<ApiToken?> getToken();

  Future<void> setToken(ApiToken token);

  Future<void> deleteToken();
}

class ApiTokenPreferences extends TokenPreferences {
  static const String tokenKey = 'token';

  @override
  Future<ApiToken?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey);
    if (token != null) {
      final tokenDecode = jsonDecode(utf8.decode(base64Decode(token)));
      return ApiToken.fromJson(tokenDecode as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> setToken(ApiToken token) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenEncode = base64Encode(utf8.encode(jsonEncode(token.toJson())));
    prefs.setString(tokenKey, tokenEncode);
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(tokenKey);
  }
}
