// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomButtonState on ImplCustomButtonState, Store {
  late final _$isButtonEnabledAtom =
      Atom(name: 'ImplCustomButtonState.isButtonEnabled', context: context);

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  late final _$indexAtom =
      Atom(name: 'ImplCustomButtonState.index', context: context);

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

  late final _$isPressedAtom =
      Atom(name: 'ImplCustomButtonState.isPressed', context: context);

  @override
  bool get isPressed {
    _$isPressedAtom.reportRead();
    return super.isPressed;
  }

  @override
  set isPressed(bool value) {
    _$isPressedAtom.reportWrite(value, super.isPressed, () {
      super.isPressed = value;
    });
  }

  late final _$ImplCustomButtonStateActionController =
      ActionController(name: 'ImplCustomButtonState', context: context);

  @override
  void updateButton(bool newValue) {
    final _$actionInfo = _$ImplCustomButtonStateActionController.startAction(
        name: 'ImplCustomButtonState.updateButton');
    try {
      return super.updateButton(newValue);
    } finally {
      _$ImplCustomButtonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonEnabled: ${isButtonEnabled},
index: ${index},
isPressed: ${isPressed}
    ''';
  }
}
