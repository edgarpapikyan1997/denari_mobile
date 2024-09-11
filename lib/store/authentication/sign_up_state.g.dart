// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpState on ImplSignUpState, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: 'ImplSignUpState.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'ImplSignUpState.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'ImplSignUpState.isPasswordValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: 'ImplSignUpState.isPhoneValid'))
          .value;
  Computed<bool>? _$createButtonEnabledComputed;

  @override
  bool get createButtonEnabled => (_$createButtonEnabledComputed ??=
          Computed<bool>(() => super.createButtonEnabled,
              name: 'ImplSignUpState.createButtonEnabled'))
      .value;

  late final _$signUpAtom =
      Atom(name: 'ImplSignUpState.signUp', context: context);

  @override
  String? get signUp {
    _$signUpAtom.reportRead();
    return super.signUp;
  }

  @override
  set signUp(String? value) {
    _$signUpAtom.reportWrite(value, super.signUp, () {
      super.signUp = value;
    });
  }

  late final _$nameAtom = Atom(name: 'ImplSignUpState.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ImplSignUpState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'ImplSignUpState.password', context: context);

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
      Atom(name: 'ImplSignUpState.phone', context: context);

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

  late final _$codeAtom = Atom(name: 'ImplSignUpState.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ImplSignUpState.loading', context: context);

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

  late final _$codeSentAtom =
      Atom(name: 'ImplSignUpState.codeSent', context: context);

  @override
  String? get codeSent {
    _$codeSentAtom.reportRead();
    return super.codeSent;
  }

  @override
  set codeSent(String? value) {
    _$codeSentAtom.reportWrite(value, super.codeSent, () {
      super.codeSent = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('ImplSignUpState.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$getCodeAsyncAction =
      AsyncAction('ImplSignUpState.getCode', context: context);

  @override
  Future<void> getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  late final _$ImplSignUpStateActionController =
      ActionController(name: 'ImplSignUpState', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$ImplSignUpStateActionController.startAction(
        name: 'ImplSignUpState.setName');
    try {
      return super.setName(value);
    } finally {
      _$ImplSignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ImplSignUpStateActionController.startAction(
        name: 'ImplSignUpState.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ImplSignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ImplSignUpStateActionController.startAction(
        name: 'ImplSignUpState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ImplSignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$ImplSignUpStateActionController.startAction(
        name: 'ImplSignUpState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ImplSignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ImplSignUpStateActionController.startAction(
        name: 'ImplSignUpState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ImplSignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signUp: ${signUp},
name: ${name},
email: ${email},
password: ${password},
phone: ${phone},
code: ${code},
loading: ${loading},
codeSent: ${codeSent},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
createButtonEnabled: ${createButtonEnabled}
    ''';
  }
}
