import 'package:denari_app/data/token/repository/token_repository.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';

import '../../data/token/model/token_balance/token_balance_model.dart';
import '../../data/token/model/token_model.dart';

part 'token_balance_state.g.dart';

class TokenBalanceState = ImplTokenBalanceState with _$TokenBalanceState;

abstract class ImplTokenBalanceState with Store {
  final TokenRepository? _tokenRepository;

  ImplTokenBalanceState({
    required TokenRepository? tokenRepository,
  }) : _tokenRepository = tokenRepository;

  @observable
  int? balance = 0;

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
    try {
      final data = await _tokenRepository!.getTokenBalance();
      tokenBalance = data;
      balance = int.parse(tokenBalance!.totalBalance);
    } catch (error) {
      getError = error.toString();
      balance = 0;
    }
  }

  @action
  Future<void> getTokenBalanceHistory() async {
    try {
      final List<TokenModel> data = await _tokenRepository!.getUserTokenBalanceHistory();
      tokenModels = data;
    } catch (error) {
      getError = error.toString();
    }
  }

  @action
  int getTokenBalanceByBrand({String? brand}) {
    Random random = Random();
    int brandToken = random.nextInt(100);
    return brandToken;
  }
}



