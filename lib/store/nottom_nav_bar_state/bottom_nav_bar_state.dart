import 'package:mobx/mobx.dart';

// Include generated file
part 'bottom_nav_bar_state.g.dart';

// This is the class used by rest of your codebase
class BottomNavBarState = _BottomNavBarState with _$BottomNavBarState;

// The store-class
abstract class _BottomNavBarState with Store {
  @observable
  int index = 4;

  @action
  void changeIndex(newIndex) {
    index = newIndex;
  }
}