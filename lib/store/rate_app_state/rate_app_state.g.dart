// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RateAppState on ImplRateAppState, Store {
  late final _$indexAtom =
      Atom(name: 'ImplRateAppState.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$ImplRateAppStateActionController =
      ActionController(name: 'ImplRateAppState', context: context);

  @override
  void setIndex(int newIndex) {
    final _$actionInfo = _$ImplRateAppStateActionController.startAction(
        name: 'ImplRateAppState.setIndex');
    try {
      return super.setIndex(newIndex);
    } finally {
      _$ImplRateAppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
