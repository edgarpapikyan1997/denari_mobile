import 'package:flutter/widgets.dart';

final profileUpdateListener = ProfileUpdateListenable();

final class ProfileUpdateListenable extends ChangeNotifier {

  void onUpdateProfile() {
    notifyListeners();
  }
}