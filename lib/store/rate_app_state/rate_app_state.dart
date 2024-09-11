import 'package:mobx/mobx.dart';

part 'rate_app_state.g.dart';

class RateAppState = ImplRateAppState with _$RateAppState;

abstract class ImplRateAppState with Store {
  @observable
  int index = 0;

  @action
  void setIndex(int newIndex) {
    index = newIndex;
  }
}
