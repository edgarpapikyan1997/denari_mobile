import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/model/reset_model.dart';
import 'package:denari_app/utils/network/model/api_token.dart';

abstract class AuthRepository {
  Future<ApiToken> register(RegModel data);

  Future<bool> verify(String phone);

  Future<ApiToken> login(LoginModel data);

  Future<bool> reset(ResetModel data);
}
