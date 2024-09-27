// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sending_amount_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendingAmountState on _SendingAmountState, Store {
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_SendingAmountState.isError'))
      .value;

  late final _$currentBalanceAtom =
      Atom(name: '_SendingAmountState.currentBalance', context: context);

  @override
  int get currentBalance {
    _$currentBalanceAtom.reportRead();
    return super.currentBalance;
  }

  @override
  set currentBalance(int value) {
    _$currentBalanceAtom.reportWrite(value, super.currentBalance, () {
      super.currentBalance = value;
    });
  }

  late final _$sendingAmountAtom =
      Atom(name: '_SendingAmountState.sendingAmount', context: context);

  @override
  int get sendingAmount {
    _$sendingAmountAtom.reportRead();
    return super.sendingAmount;
  }

  @override
  set sendingAmount(int value) {
    _$sendingAmountAtom.reportWrite(value, super.sendingAmount, () {
      super.sendingAmount = value;
    });
  }

  late final _$isAmountHigherAtom =
      Atom(name: '_SendingAmountState.isAmountHigher', context: context);

  @override
  bool get isAmountHigher {
    _$isAmountHigherAtom.reportRead();
    return super.isAmountHigher;
  }

  @override
  set isAmountHigher(bool value) {
    _$isAmountHigherAtom.reportWrite(value, super.isAmountHigher, () {
      super.isAmountHigher = value;
    });
  }

  late final _$_SendingAmountStateActionController =
      ActionController(name: '_SendingAmountState', context: context);

  @override
  void setCurrentBalance({required int valueFromBalance}) {
    final _$actionInfo = _$_SendingAmountStateActionController.startAction(
        name: '_SendingAmountState.setCurrentBalance');
    try {
      return super.setCurrentBalance(valueFromBalance: valueFromBalance);
    } finally {
      _$_SendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSendingAmount({required int amount}) {
    final _$actionInfo = _$_SendingAmountStateActionController.startAction(
        name: '_SendingAmountState.setSendingAmount');
    try {
      return super.setSendingAmount(amount: amount);
    } finally {
      _$_SendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentBalance: ${currentBalance},
sendingAmount: ${sendingAmount},
isAmountHigher: ${isAmountHigher},
isError: ${isError}
    ''';
  }
}
