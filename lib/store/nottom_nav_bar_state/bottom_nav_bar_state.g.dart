// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_bar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavBarState on _BottomNavBarState, Store {
  late final _$indexAtom =
      Atom(name: '_BottomNavBarState.index', context: context);

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

  late final _$_BottomNavBarStateActionController =
      ActionController(name: '_BottomNavBarState', context: context);

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo = _$_BottomNavBarStateActionController.startAction(
        name: '_BottomNavBarState.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_BottomNavBarStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
