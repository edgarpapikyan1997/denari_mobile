// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenBalanceState on ImplTokenBalanceState, Store {
  late final _$balanceAtom =
      Atom(name: 'ImplTokenBalanceState.balance', context: context);

  @override
  int get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(int value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$tokenModelsAtom =
      Atom(name: 'ImplTokenBalanceState.tokenModels', context: context);

  @override
  List<TokenModel> get tokenModels {
    _$tokenModelsAtom.reportRead();
    return super.tokenModels;
  }

  @override
  set tokenModels(List<TokenModel> value) {
    _$tokenModelsAtom.reportWrite(value, super.tokenModels, () {
      super.tokenModels = value;
    });
  }

  late final _$tokenBalanceAtom =
      Atom(name: 'ImplTokenBalanceState.tokenBalance', context: context);

  @override
  TokenBalanceModel? get tokenBalance {
    _$tokenBalanceAtom.reportRead();
    return super.tokenBalance;
  }

  @override
  set tokenBalance(TokenBalanceModel? value) {
    _$tokenBalanceAtom.reportWrite(value, super.tokenBalance, () {
      super.tokenBalance = value;
    });
  }

  late final _$giftCardLDAtom =
      Atom(name: 'ImplTokenBalanceState.giftCardLD', context: context);

  @override
  int get giftCardLD {
    _$giftCardLDAtom.reportRead();
    return super.giftCardLD;
  }

  @override
  set giftCardLD(int value) {
    _$giftCardLDAtom.reportWrite(value, super.giftCardLD, () {
      super.giftCardLD = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: 'ImplTokenBalanceState.getError', context: context);

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

  late final _$getTokenBalanceAsyncAction =
      AsyncAction('ImplTokenBalanceState.getTokenBalance', context: context);

  @override
  Future<void> getTokenBalance() {
    return _$getTokenBalanceAsyncAction.run(() => super.getTokenBalance());
  }

  late final _$getTokenBalanceHistoryAsyncAction = AsyncAction(
      'ImplTokenBalanceState.getTokenBalanceHistory',
      context: context);

  @override
  Future<void> getTokenBalanceHistory() {
    return _$getTokenBalanceHistoryAsyncAction
        .run(() => super.getTokenBalanceHistory());
  }

  late final _$ImplTokenBalanceStateActionController =
      ActionController(name: 'ImplTokenBalanceState', context: context);

  @override
  int getTokenBalanceByBrand({String? brand}) {
    final _$actionInfo = _$ImplTokenBalanceStateActionController.startAction(
        name: 'ImplTokenBalanceState.getTokenBalanceByBrand');
    try {
      return super.getTokenBalanceByBrand(brand: brand);
    } finally {
      _$ImplTokenBalanceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
balance: ${balance},
tokenModels: ${tokenModels},
tokenBalance: ${tokenBalance},
giftCardLD: ${giftCardLD},
getError: ${getError}
    ''';
  }
}
