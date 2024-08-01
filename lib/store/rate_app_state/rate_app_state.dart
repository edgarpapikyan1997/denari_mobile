import 'package:mobx/mobx.dart';

part 'rate_app_state.g.dart';

class RateAppState = _RateAppState with _$RateAppState;

abstract class _RateAppState with Store {
  @observable
  int index = 0;

  @action
  void setIndex(int newIndex) {
    index = newIndex;
  }
}
