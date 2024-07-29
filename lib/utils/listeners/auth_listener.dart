import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:flutter/widgets.dart';

final authListener = AuthListenable();

final class AuthListenable extends ChangeNotifier {
  bool isLogin = false;

  void login() {
    isLogin = true;
    notifyListeners();
  }

  void logout() {
    isLogin = false;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    final result = await di.get<TokenPreferences>().getToken();
    if (result != null) {
      login();
    } else {
      logout();
    }
  }
}