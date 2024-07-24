import 'package:mobx/mobx.dart';
import '../../view/widgets/brand_item/brand_item_widget.dart';

part 'brand_item_select_state.g.dart';

class BrandItemSelectState = _BrandItemSelectState with _$BrandItemSelectState;

abstract class _BrandItemSelectState with Store {

  @observable
  BrandItemWidget? brandItemWidget;

  @observable
  int index = 0;

  @observable
  List<int> indexes = [];

  @action
  void setItemWidget(BrandItemWidget newValue) {
    brandItemWidget = newValue;
  }

  @action
  void selectItem(int newIndex, ) {
    index = newIndex;
  }

  @action
  void selectItems(List<int> newValues) {
    indexes = newValues;
  }
}
