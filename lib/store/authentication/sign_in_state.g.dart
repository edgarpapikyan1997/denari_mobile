// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInState on ImplSignInState, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'ImplSignInState.isPasswordValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: 'ImplSignInState.isPhoneValid'))
          .value;
  Computed<bool>? _$loginButtonEnabledComputed;

  @override
  bool get loginButtonEnabled => (_$loginButtonEnabledComputed ??=
          Computed<bool>(() => super.loginButtonEnabled,
              name: 'ImplSignInState.loginButtonEnabled'))
      .value;

  late final _$signInAtom =
      Atom(name: 'ImplSignInState.signIn', context: context);

  @override
  String? get signIn {
    _$signInAtom.reportRead();
    return super.signIn;
  }

  @override
  set signIn(String? value) {
    _$signInAtom.reportWrite(value, super.signIn, () {
      super.signIn = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'ImplSignInState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'ImplSignInState.phone', context: context);

  @override
  PhoneNumber? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(PhoneNumber? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ImplSignInState.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('ImplSignInState.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$ImplSignInStateActionController =
      ActionController(name: 'ImplSignInState', context: context);

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ImplSignInStateActionController.startAction(
        name: 'ImplSignInState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ImplSignInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$ImplSignInStateActionController.startAction(
        name: 'ImplSignInState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ImplSignInStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signIn: ${signIn},
password: ${password},
phone: ${phone},
loading: ${loading},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
loginButtonEnabled: ${loginButtonEnabled}
    ''';
  }
}
