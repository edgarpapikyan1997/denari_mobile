import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/model/reset_pass_model.dart';
import 'package:denari_app/data/authentication/model/change_pass_model.dart';
import 'package:denari_app/utils/network/model/api_token.dart';

abstract class AuthRepository {
  Future<ApiToken> register(RegModel data);

  Future<bool> verify(String phone);

  Future<ApiToken> login(LoginModel data);

  Future<bool> resetPassword(ResetPassModel data);
  
  Future<bool> changePassword(ChangePassModel data);
}
