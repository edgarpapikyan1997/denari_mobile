import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/model/reset_model.dart';
import 'package:denari_app/data/token/model/token_balance/token_balance_model.dart';
import 'package:denari_app/data/token/model/token_model.dart';
import 'package:denari_app/utils/network/model/api_token.dart';

abstract class TokenRepository {
  Future<List<TokenModel>> getUserTokenBalanceHistory();

  Future<TokenBalanceModel> getTokenBalance();


}
