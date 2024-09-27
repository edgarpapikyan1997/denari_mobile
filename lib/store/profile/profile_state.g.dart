// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileState on _ProfileState, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_ProfileState.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_ProfileState.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_ProfileState.isPasswordValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_ProfileState.isPhoneValid'))
          .value;
  Computed<bool>? _$isBirthdayValidComputed;

  @override
  bool get isBirthdayValid =>
      (_$isBirthdayValidComputed ??= Computed<bool>(() => super.isBirthdayValid,
              name: '_ProfileState.isBirthdayValid'))
          .value;
  Computed<bool>? _$updateButtonEnabledComputed;

  @override
  bool get updateButtonEnabled => (_$updateButtonEnabledComputed ??=
          Computed<bool>(() => super.updateButtonEnabled,
              name: '_ProfileState.updateButtonEnabled'))
      .value;

  late final _$profileAtom =
      Atom(name: '_ProfileState.profile', context: context);

  @override
  Profile get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: '_ProfileState.getError', context: context);

  @override
  String? get getError {
    _$getErrorAtom.reportRead();
    return super.getError;
  }

  @override
  set getError(String? value) {
    _$getErrorAtom.reportWrite(value, super.getError, () {
      super.getError = value;
    });
  }

  late final _$updateErrorAtom =
      Atom(name: '_ProfileState.updateError', context: context);

  @override
  String? get updateError {
    _$updateErrorAtom.reportRead();
    return super.updateError;
  }

  @override
  set updateError(String? value) {
    _$updateErrorAtom.reportWrite(value, super.updateError, () {
      super.updateError = value;
    });
  }

  late final _$nameAtom = Atom(name: '_ProfileState.name', context: context);

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

  late final _$emailAtom = Atom(name: '_ProfileState.email', context: context);

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
      Atom(name: '_ProfileState.password', context: context);

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

  late final _$phoneAtom = Atom(name: '_ProfileState.phone', context: context);

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

  late final _$birthdayAtom =
      Atom(name: '_ProfileState.birthday', context: context);

  @override
  DateTime? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  late final _$codeAtom = Atom(name: '_ProfileState.code', context: context);

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
      Atom(name: '_ProfileState.loading', context: context);

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

  late final _$isCodeValidAtom =
      Atom(name: '_ProfileState.isCodeValid', context: context);

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

  late final _$codeSentErrorAtom =
      Atom(name: '_ProfileState.codeSentError', context: context);

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

  late final _$getProfileAsyncAction =
      AsyncAction('_ProfileState.getProfile', context: context);

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_ProfileState.updateProfile', context: context);

  @override
  Future<void> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  late final _$getCodeAsyncAction =
      AsyncAction('_ProfileState.getCode', context: context);

  @override
  Future<void> getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  late final _$_ProfileStateActionController =
      ActionController(name: '_ProfileState', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthday(DateTime value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setBirthday');
    try {
      return super.setBirthday(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$_ProfileStateActionController.startAction(
        name: '_ProfileState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
getError: ${getError},
updateError: ${updateError},
name: ${name},
email: ${email},
password: ${password},
phone: ${phone},
birthday: ${birthday},
code: ${code},
loading: ${loading},
isCodeValid: ${isCodeValid},
codeSentError: ${codeSentError},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
isBirthdayValid: ${isBirthdayValid},
updateButtonEnabled: ${updateButtonEnabled}
    ''';
  }
}
