import 'package:mobx/mobx.dart';

part 'sending_amount_state.g.dart';

class SendingAmountState = ImplSendingAmountState with _$SendingAmountState;

abstract class ImplSendingAmountState with Store {
  @observable
  int currentBalance = 0;

  @observable
  int sendingAmount = 0;

  @observable
  bool isAmountHigher = true;

  @observable
  String sendingContactInfo = "";

  @computed
  bool get isError => sendingAmount < 0;

  @action
  void setContactInfo({required String newContactInfo}) {
    sendingContactInfo = newContactInfo;
  }


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
