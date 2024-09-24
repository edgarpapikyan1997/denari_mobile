// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopsState on ShopsStatePerformer, Store {
  Computed<bool>? _$isAnyCheckBoxSelectedComputed;

  @override
  bool get isAnyCheckBoxSelected => (_$isAnyCheckBoxSelectedComputed ??=
          Computed<bool>(() => super.isAnyCheckBoxSelected,
              name: 'ShopsStatePerformer.isAnyCheckBoxSelected'))
      .value;

  late final _$shopsAtom =
      Atom(name: 'ShopsStatePerformer.shops', context: context);

  @override
  List<ShopsModel> get shops {
    _$shopsAtom.reportRead();
    return super.shops;
  }

  @override
  set shops(List<ShopsModel> value) {
    _$shopsAtom.reportWrite(value, super.shops, () {
      super.shops = value;
    });
  }

  late final _$chosenAddressItemsAtom =
      Atom(name: 'ShopsStatePerformer.chosenAddressItems', context: context);

  @override
  List<Map<String, dynamic>> get chosenAddressItems {
    _$chosenAddressItemsAtom.reportRead();
    return super.chosenAddressItems;
  }

  @override
  set chosenAddressItems(List<Map<String, dynamic>> value) {
    _$chosenAddressItemsAtom.reportWrite(value, super.chosenAddressItems, () {
      super.chosenAddressItems = value;
    });
  }

  late final _$shopsUnitModelListAtom =
      Atom(name: 'ShopsStatePerformer.shopsUnitModelList', context: context);

  @override
  List<ShopsUnitModel> get shopsUnitModelList {
    _$shopsUnitModelListAtom.reportRead();
    return super.shopsUnitModelList;
  }

  @override
  set shopsUnitModelList(List<ShopsUnitModel> value) {
    _$shopsUnitModelListAtom.reportWrite(value, super.shopsUnitModelList, () {
      super.shopsUnitModelList = value;
    });
  }

  late final _$checkedStoreItemsAtom =
      Atom(name: 'ShopsStatePerformer.checkedStoreItems', context: context);

  @override
  List<Map<String, dynamic>> get checkedStoreItems {
    _$checkedStoreItemsAtom.reportRead();
    return super.checkedStoreItems;
  }

  @override
  set checkedStoreItems(List<Map<String, dynamic>> value) {
    _$checkedStoreItemsAtom.reportWrite(value, super.checkedStoreItems, () {
      super.checkedStoreItems = value;
    });
  }

  late final _$checkedAddressItemsAtom =
      Atom(name: 'ShopsStatePerformer.checkedAddressItems', context: context);

  @override
  List<Map<String, dynamic>> get checkedAddressItems {
    _$checkedAddressItemsAtom.reportRead();
    return super.checkedAddressItems;
  }

  @override
  set checkedAddressItems(List<Map<String, dynamic>> value) {
    _$checkedAddressItemsAtom.reportWrite(value, super.checkedAddressItems, () {
      super.checkedAddressItems = value;
    });
  }

  late final _$checkBoxValuesAtom =
      Atom(name: 'ShopsStatePerformer.checkBoxValues', context: context);

  @override
  ObservableList<bool> get checkBoxValues {
    _$checkBoxValuesAtom.reportRead();
    return super.checkBoxValues;
  }

  @override
  set checkBoxValues(ObservableList<bool> value) {
    _$checkBoxValuesAtom.reportWrite(value, super.checkBoxValues, () {
      super.checkBoxValues = value;
    });
  }

  late final _$addressCheckBoxValuesAtom =
      Atom(name: 'ShopsStatePerformer.addressCheckBoxValues', context: context);

  @override
  ObservableList<bool> get addressCheckBoxValues {
    _$addressCheckBoxValuesAtom.reportRead();
    return super.addressCheckBoxValues;
  }

  @override
  set addressCheckBoxValues(ObservableList<bool> value) {
    _$addressCheckBoxValuesAtom.reportWrite(value, super.addressCheckBoxValues,
        () {
      super.addressCheckBoxValues = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: 'ShopsStatePerformer.getError', context: context);

  @override
  String? get getError {
    _$getErrorAtom.reportRead();
    return super.getError;
  }

  @override
  set getError(String? value) {
    _$getErrorAtom.reportWrite(value, super.getError, () {
      super.getError = value;
    });
  }

  late final _$shopsUnitModelAtom =
      Atom(name: 'ShopsStatePerformer.shopsUnitModel', context: context);

  @override
  ShopsUnitModel? get shopsUnitModel {
    _$shopsUnitModelAtom.reportRead();
    return super.shopsUnitModel;
  }

  @override
  set shopsUnitModel(ShopsUnitModel? value) {
    _$shopsUnitModelAtom.reportWrite(value, super.shopsUnitModel, () {
      super.shopsUnitModel = value;
    });
  }

  late final _$getAllShopsAsyncAction =
      AsyncAction('ShopsStatePerformer.getAllShops', context: context);

  @override
  Future<void> getAllShops() {
    return _$getAllShopsAsyncAction.run(() => super.getAllShops());
  }

  late final _$getShopsByCategoryAsyncAction =
      AsyncAction('ShopsStatePerformer.getShopsByCategory', context: context);

  @override
  Future<void> getShopsByCategory({required String categories}) {
    return _$getShopsByCategoryAsyncAction
        .run(() => super.getShopsByCategory(categories: categories));
  }

  late final _$getShopByIDAsyncAction =
      AsyncAction('ShopsStatePerformer.getShopByID', context: context);

  @override
  Future<void> getShopByID({required String id}) {
    return _$getShopByIDAsyncAction.run(() => super.getShopByID(id: id));
  }

  late final _$getShopByIDtoListAsyncAction =
      AsyncAction('ShopsStatePerformer.getShopByIDtoList', context: context);

  @override
  Future<void> getShopByIDtoList({required List<Map<String, dynamic>> items}) {
    return _$getShopByIDtoListAsyncAction
        .run(() => super.getShopByIDtoList(items: items));
  }

  late final _$ShopsStatePerformerActionController =
      ActionController(name: 'ShopsStatePerformer', context: context);

  @override
  void updateCheckBox(
      {required int index, int? branchIndex, bool isAddress = false}) {
    final _$actionInfo = _$ShopsStatePerformerActionController.startAction(
        name: 'ShopsStatePerformer.updateCheckBox');
    try {
      return super.updateCheckBox(
          index: index, branchIndex: branchIndex, isAddress: isAddress);
    } finally {
      _$ShopsStatePerformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkBoxReset({bool isAddress = false}) {
    final _$actionInfo = _$ShopsStatePerformerActionController.startAction(
        name: 'ShopsStatePerformer.checkBoxReset');
    try {
      return super.checkBoxReset(isAddress: isAddress);
    } finally {
      _$ShopsStatePerformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shops: ${shops},
chosenAddressItems: ${chosenAddressItems},
shopsUnitModelList: ${shopsUnitModelList},
checkedStoreItems: ${checkedStoreItems},
checkedAddressItems: ${checkedAddressItems},
checkBoxValues: ${checkBoxValues},
addressCheckBoxValues: ${addressCheckBoxValues},
getError: ${getError},
shopsUnitModel: ${shopsUnitModel},
isAnyCheckBoxSelected: ${isAnyCheckBoxSelected}
    ''';
  }
}
