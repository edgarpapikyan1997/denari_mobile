import 'package:mobx/mobx.dart';

part 'sending_amount_state.g.dart';

class SendingAmountState = _SendingAmountState with _$SendingAmountState;

abstract class _SendingAmountState with Store {
  @observable
  int currentBalance = 0;

  @observable
  int sendingAmount = 0;

  @observable
  bool isAmountHigher = true;

  @computed
  bool get isError => sendingAmount > currentBalance;

  @action
  void setCurrentBalance({required int valueFromBalance}) {
    currentBalance = valueFromBalance;
  }

  @action
  void setSendingAmount({required int amount}) {
    if (isAmountHigher == true) {
      sendingAmount = amount;
    }
  }
}
