import 'dart:ui';
import 'package:mobx/mobx.dart';

import '../../constants/categories.dart';

part 'categories_state.g.dart';

class CategoriesState = CategoriesStatePerformer with _$CategoriesState;

abstract class CategoriesStatePerformer with Store {
  @observable
  String? currentCategory;

  @observable
  CategoryType? categoryType;

  @observable
  Color? itemColor;

  @observable
  ObservableList<CategoryType> selectedCategories = ObservableList<CategoryType>();

  @action
  void addCategory(CategoryType categoryType) {
    selectedCategories.add(categoryType);
  }

  @action
  void removeCategory(CategoryType categoryType) {
    selectedCategories.remove(categoryType);
  }

  @action
  void selectCategory(
      {required String categoryName, required CategoryType newCategoryType}) {
    currentCategory = categoryName;
    categoryType = newCategoryType;
  }

  @action
  void unselectCategory() {
    currentCategory = null;
    categoryType = null;
  }
}
