// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SliderState on SliderConfigState, Store {
  late final _$maxTokenAtom =
      Atom(name: 'SliderConfigState.maxToken', context: context);

  @override
  int get maxToken {
    _$maxTokenAtom.reportRead();
    return super.maxToken;
  }

  @override
  set maxToken(int value) {
    _$maxTokenAtom.reportWrite(value, super.maxToken, () {
      super.maxToken = value;
    });
  }

  late final _$maxGiftAtom =
      Atom(name: 'SliderConfigState.maxGift', context: context);

  @override
  int get maxGift {
    _$maxGiftAtom.reportRead();
    return super.maxGift;
  }

  @override
  set maxGift(int value) {
    _$maxGiftAtom.reportWrite(value, super.maxGift, () {
      super.maxGift = value;
    });
  }

  late final _$giftValueAtom =
      Atom(name: 'SliderConfigState.giftValue', context: context);

  @override
  int get giftValue {
    _$giftValueAtom.reportRead();
    return super.giftValue;
  }

  @override
  set giftValue(int value) {
    _$giftValueAtom.reportWrite(value, super.giftValue, () {
      super.giftValue = value;
    });
  }

  late final _$tokenValueAtom =
      Atom(name: 'SliderConfigState.tokenValue', context: context);

  @override
  int get tokenValue {
    _$tokenValueAtom.reportRead();
    return super.tokenValue;
  }

  @override
  set tokenValue(int value) {
    _$tokenValueAtom.reportWrite(value, super.tokenValue, () {
      super.tokenValue = value;
    });
  }

  late final _$transactionAmountAtom =
      Atom(name: 'SliderConfigState.transactionAmount', context: context);

  @override
  int get transactionAmount {
    _$transactionAmountAtom.reportRead();
    return super.transactionAmount;
  }

  @override
  set transactionAmount(int value) {
    _$transactionAmountAtom.reportWrite(value, super.transactionAmount, () {
      super.transactionAmount = value;
    });
  }

  late final _$SliderConfigStateActionController =
      ActionController(name: 'SliderConfigState', context: context);

  @override
  void changeTokenValue(int newValue) {
    final _$actionInfo = _$SliderConfigStateActionController.startAction(
        name: 'SliderConfigState.changeTokenValue');
    try {
      return super.changeTokenValue(newValue);
    } finally {
      _$SliderConfigStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGiftCardLDValue(int newValue) {
    final _$actionInfo = _$SliderConfigStateActionController.startAction(
        name: 'SliderConfigState.changeGiftCardLDValue');
    try {
      return super.changeGiftCardLDValue(newValue);
    } finally {
      _$SliderConfigStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
maxToken: ${maxToken},
maxGift: ${maxGift},
giftValue: ${giftValue},
tokenValue: ${tokenValue},
transactionAmount: ${transactionAmount}
    ''';
  }
}
