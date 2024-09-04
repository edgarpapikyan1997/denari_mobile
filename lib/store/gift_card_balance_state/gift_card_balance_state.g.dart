// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GiftCardBalanceState on ImplGiftCardBalanceState, Store {
  late final _$balanceAtom =
      Atom(name: 'ImplGiftCardBalanceState.balance', context: context);

  @override
  int? get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(int? value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$giftCardModelsAtom =
      Atom(name: 'ImplGiftCardBalanceState.giftCardModels', context: context);

  @override
  List<GiftCardModel> get giftCardModels {
    _$giftCardModelsAtom.reportRead();
    return super.giftCardModels;
  }

  @override
  set giftCardModels(List<GiftCardModel> value) {
    _$giftCardModelsAtom.reportWrite(value, super.giftCardModels, () {
      super.giftCardModels = value;
    });
  }

  late final _$giftCardBalanceAtom =
      Atom(name: 'ImplGiftCardBalanceState.giftCardBalance', context: context);

  @override
  GiftCardBalanceModel? get giftCardBalance {
    _$giftCardBalanceAtom.reportRead();
    return super.giftCardBalance;
  }

  @override
  set giftCardBalance(GiftCardBalanceModel? value) {
    _$giftCardBalanceAtom.reportWrite(value, super.giftCardBalance, () {
      super.giftCardBalance = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: 'ImplGiftCardBalanceState.getError', context: context);

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

  late final _$getGiftCardBalanceAsyncAction = AsyncAction(
      'ImplGiftCardBalanceState.getGiftCardBalance',
      context: context);

  @override
  Future<void> getGiftCardBalance() {
    return _$getGiftCardBalanceAsyncAction
        .run(() => super.getGiftCardBalance());
  }

  late final _$getGiftCardBalanceHistoryAsyncAction = AsyncAction(
      'ImplGiftCardBalanceState.getGiftCardBalanceHistory',
      context: context);

  @override
  Future<void> getGiftCardBalanceHistory() {
    return _$getGiftCardBalanceHistoryAsyncAction
        .run(() => super.getGiftCardBalanceHistory());
  }

  late final _$ImplGiftCardBalanceStateActionController =
      ActionController(name: 'ImplGiftCardBalanceState', context: context);

  @override
  int getGiftBalanceByBrand({String? brand}) {
    final _$actionInfo = _$ImplGiftCardBalanceStateActionController.startAction(
        name: 'ImplGiftCardBalanceState.getGiftBalanceByBrand');
    try {
      return super.getGiftBalanceByBrand(brand: brand);
    } finally {
      _$ImplGiftCardBalanceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
balance: ${balance},
giftCardModels: ${giftCardModels},
giftCardBalance: ${giftCardBalance},
getError: ${getError}
    ''';
  }
}
