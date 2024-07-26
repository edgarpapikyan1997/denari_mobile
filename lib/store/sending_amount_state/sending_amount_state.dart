import 'package:mobx/mobx.dart';

part 'sending_amount_state.g.dart';

class SendingAmountState = _SendingAmountState with _$SendingAmountState;

abstract class _SendingAmountState with Store {
  @observable
  int currentBalance = 0;

  @observable
  int sendingAmount = 0;

  @action
  void setCurrentBalance({required int valueFromBalance}) {
    currentBalance = valueFromBalance;
  }

  @action
  void setSendingAmount({required int amount}) {
    if (sendingAmount <= currentBalance) {
      sendingAmount = amount;
    }
  }
}
