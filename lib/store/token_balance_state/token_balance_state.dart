import 'package:mobx/mobx.dart';
import 'dart:math';

part 'token_balance_state.g.dart';

class TokenBalanceState = _TokenBalanceState with _$TokenBalanceState;

abstract class _TokenBalanceState with Store {

  @observable
  int earnedToken = 100;


  @observable
  int giftCardLD = 33;


  @action
  String getTokenBalanceByBrand({String? brand}) {
    Random random = Random();
    int brandToken = random.nextInt(100);
    return brandToken.toString();
  }
}
