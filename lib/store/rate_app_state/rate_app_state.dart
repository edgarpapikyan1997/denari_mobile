import 'package:mobx/mobx.dart';

part 'rate_app_state.g.dart';

class RateAppState = _RateAppState with _$RateAppState;

abstract class _RateAppState with Store {
  @observable
  int index = 0;

  @observable
  bool isSubmitEnabled = true;

  @action
  void setEnable() {
    index == 0 ? isSubmitEnabled = false : isSubmitEnabled = true;
  }

  @action
  void setIndex(int newIndex) {
    index = newIndex;
  }
}
