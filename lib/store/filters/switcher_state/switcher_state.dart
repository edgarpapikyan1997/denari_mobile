import 'package:mobx/mobx.dart';

part 'switcher_state.g.dart';

class SwitcherState = Switcher with _$SwitcherState;

abstract class Switcher with Store {
  @observable
  bool switchEnable = false;

  @action
  void updateSwitcher() {
    switchEnable = !switchEnable;
  }
}
