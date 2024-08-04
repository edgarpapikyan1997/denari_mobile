import 'dart:ui';
import 'package:mobx/mobx.dart';

import '../../constants/categories.dart';

part 'categories_state.g.dart';

class CategoriesState = _CategoriesState with _$CategoriesState;

abstract class _CategoriesState with Store {
  @observable
  String? currentCategory;

  @observable
  CategoryType? categoryType;

  @observable
  Color? itemColor;

  @action
  void selectCategory(
      {required String categoryName, required CategoryType newCategoryType}) {
    currentCategory = categoryName;
    categoryType = newCategoryType;
  }


}
