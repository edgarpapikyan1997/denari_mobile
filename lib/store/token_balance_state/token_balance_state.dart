import 'package:denari_app/data/token/repository/token_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';

import '../../data/token/model/token_balance/token_balance_model.dart';
import '../../data/token/model/token_model.dart';
import '../../utils/network/utils/use_case.dart';

part 'token_balance_state.g.dart';

class TokenBalanceState = _TokenBalanceState with _$TokenBalanceState;

abstract class _TokenBalanceState with Store {
  final TokenRepository? _tokenRepository;

  _TokenBalanceState({
    required TokenRepository? tokenRepository,
  }) : _tokenRepository = tokenRepository;

  @observable
  int balance = 0;

  @observable
  List<TokenModel> tokenModels = [];

  @observable
  TokenBalanceModel? tokenBalance;

  @observable
  int giftCardLD = 33;

  @observable
  String? getError;

  @action
  Future<void> getTokenBalance() async {
    (await handle(() => _tokenRepository!.getTokenBalance())).then(
      (data) => tokenBalance = data,
      (error) => getError = error,
    );

  }

  @action
  Future<void> getTokenBalanceHistory() async {
    (await handle(() => _tokenRepository!.getUserTokenBalanceHistory())).then(
      (data) => tokenModels = data,
      (error) => getError = error,
    );
    print(tokenModels);
  }

  @action
  int getTokenBalanceByBrand({String? brand}) {
    Random random = Random();
    int brandToken = random.nextInt(100);
    return brandToken;
  }
}
