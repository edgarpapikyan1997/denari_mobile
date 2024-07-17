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
}