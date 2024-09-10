// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_finder_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserFinderState on ImplUserFinderState, Store {
  late final _$contactInfoErrorAtom =
      Atom(name: 'ImplUserFinderState.contactInfoError', context: context);

  @override
  String? get contactInfoError {
    _$contactInfoErrorAtom.reportRead();
    return super.contactInfoError;
  }

  @override
  set contactInfoError(String? value) {
    _$contactInfoErrorAtom.reportWrite(value, super.contactInfoError, () {
      super.contactInfoError = value;
    });
  }

  late final _$contactInfoAtom =
      Atom(name: 'ImplUserFinderState.contactInfo', context: context);

  @override
  String get contactInfo {
    _$contactInfoAtom.reportRead();
    return super.contactInfo;
  }

  @override
  set contactInfo(String value) {
    _$contactInfoAtom.reportWrite(value, super.contactInfo, () {
      super.contactInfo = value;
    });
  }

  late final _$findUserAsyncAction =
      AsyncAction('ImplUserFinderState.findUser', context: context);

  @override
  Future<void> findUser(String contactInfo) {
    return _$findUserAsyncAction.run(() => super.findUser(contactInfo));
  }

  @override
  String toString() {
    return '''
contactInfoError: ${contactInfoError},
contactInfo: ${contactInfo}
    ''';
  }
}
