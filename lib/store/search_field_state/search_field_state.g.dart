// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_field_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchFieldState on ImplSearchFieldState, Store {
  late final _$showCancelAtom =
      Atom(name: 'ImplSearchFieldState.showCancel', context: context);

  @override
  bool get showCancel {
    _$showCancelAtom.reportRead();
    return super.showCancel;
  }

  @override
  set showCancel(bool value) {
    _$showCancelAtom.reportWrite(value, super.showCancel, () {
      super.showCancel = value;
    });
  }

  late final _$showSuggestionAtom =
      Atom(name: 'ImplSearchFieldState.showSuggestion', context: context);

  @override
  bool get showSuggestion {
    _$showSuggestionAtom.reportRead();
    return super.showSuggestion;
  }

  @override
  set showSuggestion(bool value) {
    _$showSuggestionAtom.reportWrite(value, super.showSuggestion, () {
      super.showSuggestion = value;
    });
  }

  late final _$filteredSuggestionsAtom =
      Atom(name: 'ImplSearchFieldState.filteredSuggestions', context: context);

  @override
  ObservableList<dynamic> get filteredSuggestions {
    _$filteredSuggestionsAtom.reportRead();
    return super.filteredSuggestions;
  }

  @override
  set filteredSuggestions(ObservableList<dynamic> value) {
    _$filteredSuggestionsAtom.reportWrite(value, super.filteredSuggestions, () {
      super.filteredSuggestions = value;
    });
  }

  late final _$ImplSearchFieldStateActionController =
      ActionController(name: 'ImplSearchFieldState', context: context);

  @override
  void filterSuggestions(String query, List<dynamic> searchList) {
    final _$actionInfo = _$ImplSearchFieldStateActionController.startAction(
        name: 'ImplSearchFieldState.filterSuggestions');
    try {
      return super.filterSuggestions(query, searchList);
    } finally {
      _$ImplSearchFieldStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showCancel: ${showCancel},
showSuggestion: ${showSuggestion},
filteredSuggestions: ${filteredSuggestions}
    ''';
  }
}
