import 'dart:ui';
import 'package:mobx/mobx.dart';
part 'categories_state.g.dart';

class CategoriesState = _CategoriesState with _$CategoriesState;

abstract class _CategoriesState with Store {

  @observable
  String? currentCategory;

  @observable
  Color? itemColor;

  @action
  void selectCategory(String categoryName) {
    currentCategory = categoryName;
  }
  @action
  void setColor(Color color){
    itemColor = color;
  }

}
