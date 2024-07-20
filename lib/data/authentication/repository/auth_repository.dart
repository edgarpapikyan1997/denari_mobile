import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/utils/network/model/api_token.dart';

import '../model/reg_model.dart';

abstract class AuthRepository {
  Future<bool> register(RegModel data);

  Future<bool> verify(String phone);

  Future<ApiToken> login(LoginModel data);
}