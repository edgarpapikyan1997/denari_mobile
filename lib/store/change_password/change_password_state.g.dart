// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordState on ImplChangePasswordState, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'ImplChangePasswordState.isPasswordValid'))
          .value;
  Computed<bool>? _$isNewPasswordValidComputed;

  @override
  bool get isNewPasswordValid => (_$isNewPasswordValidComputed ??=
          Computed<bool>(() => super.isNewPasswordValid,
              name: 'ImplChangePasswordState.isNewPasswordValid'))
      .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: 'ImplChangePasswordState.isPhoneValid'))
          .value;
  Computed<bool>? _$isCodeValidComputed;

  @override
  bool get isCodeValid =>
      (_$isCodeValidComputed ??= Computed<bool>(() => super.isCodeValid,
              name: 'ImplChangePasswordState.isCodeValid'))
          .value;
  Computed<bool>? _$changeButtonEnabledComputed;

  @override
  bool get changeButtonEnabled => (_$changeButtonEnabledComputed ??=
          Computed<bool>(() => super.changeButtonEnabled,
              name: 'ImplChangePasswordState.changeButtonEnabled'))
      .value;
  Computed<bool>? _$sendButtonEnabledComputed;

  @override
  bool get sendButtonEnabled => (_$sendButtonEnabledComputed ??= Computed<bool>(
          () => super.sendButtonEnabled,
          name: 'ImplChangePasswordState.sendButtonEnabled'))
      .value;

  late final _$changePasswordErrorAtom = Atom(
      name: 'ImplChangePasswordState.changePasswordError', context: context);

  @override
  String? get changePasswordError {
    _$changePasswordErrorAtom.reportRead();
    return super.changePasswordError;
  }

  @override
  set changePasswordError(String? value) {
    _$changePasswordErrorAtom.reportWrite(value, super.changePasswordError, () {
      super.changePasswordError = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'ImplChangePasswordState.password', context: context);

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

  late final _$newPasswordAtom =
      Atom(name: 'ImplChangePasswordState.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$passwordRepeatAtom =
      Atom(name: 'ImplChangePasswordState.passwordRepeat', context: context);

  @override
  String get passwordRepeat {
    _$passwordRepeatAtom.reportRead();
    return super.passwordRepeat;
  }

  @override
  set passwordRepeat(String value) {
    _$passwordRepeatAtom.reportWrite(value, super.passwordRepeat, () {
      super.passwordRepeat = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'ImplChangePasswordState.phone', context: context);

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

  late final _$codeAtom =
      Atom(name: 'ImplChangePasswordState.code', context: context);

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
      Atom(name: 'ImplChangePasswordState.loading', context: context);

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
      Atom(name: 'ImplChangePasswordState.codeSent', context: context);

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

  late final _$changePasswordAsyncAction =
      AsyncAction('ImplChangePasswordState.changePassword', context: context);

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$getCodeAsyncAction =
      AsyncAction('ImplChangePasswordState.getCode', context: context);

  @override
  Future<void> getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  late final _$ImplChangePasswordStateActionController =
      ActionController(name: 'ImplChangePasswordState', context: context);

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ImplChangePasswordStateActionController.startAction(
        name: 'ImplChangePasswordState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ImplChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$ImplChangePasswordStateActionController.startAction(
        name: 'ImplChangePasswordState.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$ImplChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordRepeat(String value) {
    final _$actionInfo = _$ImplChangePasswordStateActionController.startAction(
        name: 'ImplChangePasswordState.setPasswordRepeat');
    try {
      return super.setPasswordRepeat(value);
    } finally {
      _$ImplChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$ImplChangePasswordStateActionController.startAction(
        name: 'ImplChangePasswordState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ImplChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ImplChangePasswordStateActionController.startAction(
        name: 'ImplChangePasswordState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ImplChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
changePasswordError: ${changePasswordError},
password: ${password},
newPassword: ${newPassword},
passwordRepeat: ${passwordRepeat},
phone: ${phone},
code: ${code},
loading: ${loading},
codeSent: ${codeSent},
isPasswordValid: ${isPasswordValid},
isNewPasswordValid: ${isNewPasswordValid},
isPhoneValid: ${isPhoneValid},
isCodeValid: ${isCodeValid},
changeButtonEnabled: ${changeButtonEnabled},
sendButtonEnabled: ${sendButtonEnabled}
    ''';
  }
}
