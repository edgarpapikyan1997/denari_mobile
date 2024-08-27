// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InviteState on ImplInviteState, Store {
  Computed<bool>? _$isContactValidComputed;

  @override
  bool get isContactValid =>
      (_$isContactValidComputed ??= Computed<bool>(() => super.isContactValid,
              name: 'ImplInviteState.isContactValid'))
          .value;
  Computed<bool>? _$inviteButtonEnabledComputed;

  @override
  bool get inviteButtonEnabled => (_$inviteButtonEnabledComputed ??=
          Computed<bool>(() => super.inviteButtonEnabled,
              name: 'ImplInviteState.inviteButtonEnabled'))
      .value;

  late final _$inviteErrorAtom =
      Atom(name: 'ImplInviteState.inviteError', context: context);

  @override
  String? get inviteError {
    _$inviteErrorAtom.reportRead();
    return super.inviteError;
  }

  @override
  set inviteError(String? value) {
    _$inviteErrorAtom.reportWrite(value, super.inviteError, () {
      super.inviteError = value;
    });
  }

  late final _$contactAtom =
      Atom(name: 'ImplInviteState.contact', context: context);

  @override
  String get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ImplInviteState.loading', context: context);

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

  late final _$inviteAsyncAction =
      AsyncAction('ImplInviteState.invite', context: context);

  @override
  Future<void> invite() {
    return _$inviteAsyncAction.run(() => super.invite());
  }

  late final _$ImplInviteStateActionController =
      ActionController(name: 'ImplInviteState', context: context);

  @override
  void setContact(String value) {
    final _$actionInfo = _$ImplInviteStateActionController.startAction(
        name: 'ImplInviteState.setContact');
    try {
      return super.setContact(value);
    } finally {
      _$ImplInviteStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inviteError: ${inviteError},
contact: ${contact},
loading: ${loading},
isContactValid: ${isContactValid},
inviteButtonEnabled: ${inviteButtonEnabled}
    ''';
  }
}
