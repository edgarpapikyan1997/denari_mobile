import 'package:mobx/mobx.dart';

part 'brand_item_select_state.g.dart';

class BrandItemSelectState = _BrandItemSelectState with _$BrandItemSelectState;

abstract class _BrandItemSelectState with Store {
  @observable
  bool isSelected = false;

  @observable
  int index = 0;

  @observable
  List<int> indexes = [];

  @action
  void selectItem(int newValue) {
    index = newValue;
  }

  @action
  void selectItems(List<int> newValues) {
    indexes = newValues;
  }
}



