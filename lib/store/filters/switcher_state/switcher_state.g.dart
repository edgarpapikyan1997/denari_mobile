// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switcher_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SwitcherState on Switcher, Store {
  late final _$switchEnableAtom =
      Atom(name: 'Switcher.switchEnable', context: context);

  @override
  bool get switchEnable {
    _$switchEnableAtom.reportRead();
    return super.switchEnable;
  }

  @override
  set switchEnable(bool value) {
    _$switchEnableAtom.reportWrite(value, super.switchEnable, () {
      super.switchEnable = value;
    });
  }

  late final _$SwitcherActionController =
      ActionController(name: 'Switcher', context: context);

  @override
  void updateSwitcher() {
    final _$actionInfo =
        _$SwitcherActionController.startAction(name: 'Switcher.updateSwitcher');
    try {
      return super.updateSwitcher();
    } finally {
      _$SwitcherActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchEnable: ${switchEnable}
    ''';
  }
}
