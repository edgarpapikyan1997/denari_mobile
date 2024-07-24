// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpState on _SignUpState, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_SignUpState.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpState.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignUpState.isPasswordValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_SignUpState.isPhoneValid'))
          .value;
  Computed<bool>? _$createButtonEnabledComputed;

  @override
  bool get createButtonEnabled => (_$createButtonEnabledComputed ??=
          Computed<bool>(() => super.createButtonEnabled,
              name: '_SignUpState.createButtonEnabled'))
      .value;

  late final _$signUpErrorAtom =
      Atom(name: '_SignUpState.signUpError', context: context);

  @override
  String? get signUpError {
    _$signUpErrorAtom.reportRead();
    return super.signUpError;
  }

  @override
  set signUpError(String? value) {
    _$signUpErrorAtom.reportWrite(value, super.signUpError, () {
      super.signUpError = value;
    });
  }

  late final _$nameAtom = Atom(name: '_SignUpState.name', context: context);

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

  late final _$emailAtom = Atom(name: '_SignUpState.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpState.password', context: context);

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

  late final _$phoneAtom = Atom(name: '_SignUpState.phone', context: context);

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

  late final _$codeAtom = Atom(name: '_SignUpState.code', context: context);

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
      Atom(name: '_SignUpState.loading', context: context);

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

  late final _$codeSentErrorAtom =
      Atom(name: '_SignUpState.codeSentError', context: context);

  @override
  String? get codeSentError {
    _$codeSentErrorAtom.reportRead();
    return super.codeSentError;
  }

  @override
  set codeSentError(String? value) {
    _$codeSentErrorAtom.reportWrite(value, super.codeSentError, () {
      super.codeSentError = value;
    });
  }

  late final _$isCodeValidAtom =
      Atom(name: '_SignUpState.isCodeValid', context: context);

  @override
  bool get isCodeValid {
    _$isCodeValidAtom.reportRead();
    return super.isCodeValid;
  }

  @override
  set isCodeValid(bool value) {
    _$isCodeValidAtom.reportWrite(value, super.isCodeValid, () {
      super.isCodeValid = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpState.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$getCodeAsyncAction =
      AsyncAction('_SignUpState.getCode', context: context);

  @override
  Future<void> getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  late final _$_SignUpStateActionController =
      ActionController(name: '_SignUpState', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStateActionController.startAction(
        name: '_SignUpState.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStateActionController.startAction(
        name: '_SignUpState.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpStateActionController.startAction(
        name: '_SignUpState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$_SignUpStateActionController.startAction(
        name: '_SignUpState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$_SignUpStateActionController.startAction(
        name: '_SignUpState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_SignUpStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signUpError: ${signUpError},
name: ${name},
email: ${email},
password: ${password},
phone: ${phone},
code: ${code},
loading: ${loading},
codeSentError: ${codeSentError},
isCodeValid: ${isCodeValid},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
createButtonEnabled: ${createButtonEnabled}
    ''';
  }
}
