// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sending_amount_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendingAmountState on ImplSendingAmountState, Store {
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: 'ImplSendingAmountState.isError'))
      .value;

  late final _$currentBalanceAtom =
      Atom(name: 'ImplSendingAmountState.currentBalance', context: context);

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
      Atom(name: 'ImplSendingAmountState.sendingAmount', context: context);

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
      Atom(name: 'ImplSendingAmountState.isAmountHigher', context: context);

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

  late final _$sendingContactInfoAtom =
      Atom(name: 'ImplSendingAmountState.sendingContactInfo', context: context);

  @override
  String get sendingContactInfo {
    _$sendingContactInfoAtom.reportRead();
    return super.sendingContactInfo;
  }

  @override
  set sendingContactInfo(String value) {
    _$sendingContactInfoAtom.reportWrite(value, super.sendingContactInfo, () {
      super.sendingContactInfo = value;
    });
  }

  late final _$ImplSendingAmountStateActionController =
      ActionController(name: 'ImplSendingAmountState', context: context);

  @override
  void setContactInfo({required String newContactInfo}) {
    final _$actionInfo = _$ImplSendingAmountStateActionController.startAction(
        name: 'ImplSendingAmountState.setContactInfo');
    try {
      return super.setContactInfo(newContactInfo: newContactInfo);
    } finally {
      _$ImplSendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSendingInfo() {
    final _$actionInfo = _$ImplSendingAmountStateActionController.startAction(
        name: 'ImplSendingAmountState.resetSendingInfo');
    try {
      return super.resetSendingInfo();
    } finally {
      _$ImplSendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentBalance({required int valueFromBalance}) {
    final _$actionInfo = _$ImplSendingAmountStateActionController.startAction(
        name: 'ImplSendingAmountState.setCurrentBalance');
    try {
      return super.setCurrentBalance(valueFromBalance: valueFromBalance);
    } finally {
      _$ImplSendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSendingAmount({required int amount}) {
    final _$actionInfo = _$ImplSendingAmountStateActionController.startAction(
        name: 'ImplSendingAmountState.setSendingAmount');
    try {
      return super.setSendingAmount(amount: amount);
    } finally {
      _$ImplSendingAmountStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentBalance: ${currentBalance},
sendingAmount: ${sendingAmount},
isAmountHigher: ${isAmountHigher},
sendingContactInfo: ${sendingContactInfo},
isError: ${isError}
    ''';
  }
}
