// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesState on CategoriesStatePerformer, Store {
  late final _$currentCategoryAtom =
      Atom(name: 'CategoriesStatePerformer.currentCategory', context: context);

  @override
  String? get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(String? value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  late final _$categoryTypeAtom =
      Atom(name: 'CategoriesStatePerformer.categoryType', context: context);

  @override
  CategoryType? get categoryType {
    _$categoryTypeAtom.reportRead();
    return super.categoryType;
  }

  @override
  set categoryType(CategoryType? value) {
    _$categoryTypeAtom.reportWrite(value, super.categoryType, () {
      super.categoryType = value;
    });
  }

  late final _$itemColorAtom =
      Atom(name: 'CategoriesStatePerformer.itemColor', context: context);

  @override
  Color? get itemColor {
    _$itemColorAtom.reportRead();
    return super.itemColor;
  }

  @override
  set itemColor(Color? value) {
    _$itemColorAtom.reportWrite(value, super.itemColor, () {
      super.itemColor = value;
    });
  }

  late final _$selectedCategoriesAtom = Atom(
      name: 'CategoriesStatePerformer.selectedCategories', context: context);

  @override
  ObservableList<CategoryType> get selectedCategories {
    _$selectedCategoriesAtom.reportRead();
    return super.selectedCategories;
  }

  @override
  set selectedCategories(ObservableList<CategoryType> value) {
    _$selectedCategoriesAtom.reportWrite(value, super.selectedCategories, () {
      super.selectedCategories = value;
    });
  }

  late final _$CategoriesStatePerformerActionController =
      ActionController(name: 'CategoriesStatePerformer', context: context);

  @override
  void addCategory(CategoryType categoryType) {
    final _$actionInfo = _$CategoriesStatePerformerActionController.startAction(
        name: 'CategoriesStatePerformer.addCategory');
    try {
      return super.addCategory(categoryType);
    } finally {
      _$CategoriesStatePerformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(CategoryType categoryType) {
    final _$actionInfo = _$CategoriesStatePerformerActionController.startAction(
        name: 'CategoriesStatePerformer.removeCategory');
    try {
      return super.removeCategory(categoryType);
    } finally {
      _$CategoriesStatePerformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCategory(
      {required String categoryName, required CategoryType newCategoryType}) {
    final _$actionInfo = _$CategoriesStatePerformerActionController.startAction(
        name: 'CategoriesStatePerformer.selectCategory');
    try {
      return super.selectCategory(
          categoryName: categoryName, newCategoryType: newCategoryType);
    } finally {
      _$CategoriesStatePerformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCategory: ${currentCategory},
categoryType: ${categoryType},
itemColor: ${itemColor},
selectedCategories: ${selectedCategories}
    ''';
  }
}
