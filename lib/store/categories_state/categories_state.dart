import 'package:mobx/mobx.dart';

part 'categories_state.g.dart';

class CategoriesState = _CategoriesState with _$CategoriesState;

abstract class _CategoriesState with Store {

  @observable
  String? currentCategory;


  @action
  void selectCategory(String categoryName) {
    currentCategory = categoryName;
  }
}
