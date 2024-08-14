import 'package:mobx/mobx.dart';

part 'slider_state.g.dart';

class SliderState = SliderConfigState with _$SliderState;

abstract class SliderConfigState with Store {
  @observable
  double maxToken = 40;

  @observable
  double maxGift = 650;

  @observable
  double giftValue = 0;

  @observable
  double tokenValue = 0;

  @action
  void changeValue(double newValue) {

    giftValue = newValue;
    tokenValue = newValue;
  }
}
