// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_picker_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DatePickerState on ImplDatePickerState, Store {
  late final _$startDateAtom =
      Atom(name: 'ImplDatePickerState.startDate', context: context);

  @override
  DateTime? get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(DateTime? value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: 'ImplDatePickerState.endDate', context: context);

  @override
  DateTime? get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime? value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$branchesAtom =
      Atom(name: 'ImplDatePickerState.branches', context: context);

  @override
  List<String> get branches {
    _$branchesAtom.reportRead();
    return super.branches;
  }

  @override
  set branches(List<String> value) {
    _$branchesAtom.reportWrite(value, super.branches, () {
      super.branches = value;
    });
  }

  late final _$ImplDatePickerStateActionController =
      ActionController(name: 'ImplDatePickerState', context: context);

  @override
  void setStartDate(DateTime newValue) {
    final _$actionInfo = _$ImplDatePickerStateActionController.startAction(
        name: 'ImplDatePickerState.setStartDate');
    try {
      return super.setStartDate(newValue);
    } finally {
      _$ImplDatePickerStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime newValue) {
    final _$actionInfo = _$ImplDatePickerStateActionController.startAction(
        name: 'ImplDatePickerState.setEndDate');
    try {
      return super.setEndDate(newValue);
    } finally {
      _$ImplDatePickerStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
startDate: ${startDate},
endDate: ${endDate},
branches: ${branches}
    ''';
  }
}
