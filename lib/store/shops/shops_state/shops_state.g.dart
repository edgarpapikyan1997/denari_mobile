// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopsState on ShopsStatePerformer, Store {
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
  Future<void> getShopsByCategory({required String id}) {
    return _$getShopsByCategoryAsyncAction
        .run(() => super.getShopsByCategory(id: id));
  }

  late final _$getShopByIDAsyncAction =
      AsyncAction('ShopsStatePerformer.getShopByID', context: context);

  @override
  Future<void> getShopByID({required String id}) {
    return _$getShopByIDAsyncAction.run(() => super.getShopByID(id: id));
  }

  @override
  String toString() {
    return '''
shops: ${shops},
getError: ${getError},
shopsUnitModel: ${shopsUnitModel}
    ''';
  }
}
