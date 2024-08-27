import 'package:mobx/mobx.dart';

part 'slider_state.g.dart';

class SliderState = SliderConfigState with _$SliderState;

abstract class SliderConfigState with Store {
  @observable
  int maxToken = 0;

  @observable
  int maxGift = 0;

  @observable
  int giftValue = 0;

  @observable
  int tokenValue = 0;

  @action
  void changeValue(int newValue) {
    giftValue = newValue;
    tokenValue = newValue;
  }
}
