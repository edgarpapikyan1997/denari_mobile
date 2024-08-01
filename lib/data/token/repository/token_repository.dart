import 'package:denari_app/data/token/model/token_balance/token_balance_model.dart';
import 'package:denari_app/data/token/model/token_model.dart';

abstract class TokenRepository {
  Future<List<TokenModel>> getUserTokenBalanceHistory();

  Future<TokenBalanceModel> getTokenBalance();


}
