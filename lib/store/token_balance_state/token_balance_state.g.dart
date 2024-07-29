// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenBalanceState on _TokenBalanceState, Store {
  late final _$earnedTokenAtom =
      Atom(name: '_TokenBalanceState.earnedToken', context: context);

  @override
  int get earnedToken {
    _$earnedTokenAtom.reportRead();
    return super.earnedToken;
  }

  @override
  set earnedToken(int value) {
    _$earnedTokenAtom.reportWrite(value, super.earnedToken, () {
      super.earnedToken = value;
    });
  }

  late final _$giftCardLDAtom =
      Atom(name: '_TokenBalanceState.giftCardLD', context: context);

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

  late final _$_TokenBalanceStateActionController =
      ActionController(name: '_TokenBalanceState', context: context);

  @override
  int getTokenBalanceByBrand({String? brand}) {
    final _$actionInfo = _$_TokenBalanceStateActionController.startAction(
        name: '_TokenBalanceState.getTokenBalanceByBrand');
    try {
      return super.getTokenBalanceByBrand(brand: brand);
    } finally {
      _$_TokenBalanceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
earnedToken: ${earnedToken},
giftCardLD: ${giftCardLD}
    ''';
  }
}
