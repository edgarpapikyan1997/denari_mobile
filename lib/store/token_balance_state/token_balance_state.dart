import 'package:mobx/mobx.dart';
import 'dart:math';

// Include generated file
part 'token_balance_state.g.dart';

// This is the class used by rest of your codebase
class TokenBalanceState = _TokenBalanceState with _$TokenBalanceState;

// The store-class
abstract class _TokenBalanceState with Store {

  @observable
  int earnedToken = 100;



  @action
  int getTokenBalanceByBrand({String? brand}) {
    Random random = Random();
    int brandToken = random.nextInt(100);
    return brandToken;
  }
}
