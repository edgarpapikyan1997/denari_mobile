// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_item_select_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrandItemSelectState on ImplBrandItemSelectState, Store {
  late final _$brandItemWidgetAtom =
      Atom(name: 'ImplBrandItemSelectState.brandItemWidget', context: context);

  @override
  BrandItemWidget? get brandItemWidget {
    _$brandItemWidgetAtom.reportRead();
    return super.brandItemWidget;
  }

  @override
  set brandItemWidget(BrandItemWidget? value) {
    _$brandItemWidgetAtom.reportWrite(value, super.brandItemWidget, () {
      super.brandItemWidget = value;
    });
  }

  late final _$indexAtom =
      Atom(name: 'ImplBrandItemSelectState.index', context: context);

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

  late final _$indexesAtom =
      Atom(name: 'ImplBrandItemSelectState.indexes', context: context);

  @override
  List<int> get indexes {
    _$indexesAtom.reportRead();
    return super.indexes;
  }

  @override
  set indexes(List<int> value) {
    _$indexesAtom.reportWrite(value, super.indexes, () {
      super.indexes = value;
    });
  }

  late final _$ImplBrandItemSelectStateActionController =
      ActionController(name: 'ImplBrandItemSelectState', context: context);

  @override
  void setItemWidget(BrandItemWidget newValue) {
    final _$actionInfo = _$ImplBrandItemSelectStateActionController.startAction(
        name: 'ImplBrandItemSelectState.setItemWidget');
    try {
      return super.setItemWidget(newValue);
    } finally {
      _$ImplBrandItemSelectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(int newIndex) {
    final _$actionInfo = _$ImplBrandItemSelectStateActionController.startAction(
        name: 'ImplBrandItemSelectState.selectItem');
    try {
      return super.selectItem(newIndex);
    } finally {
      _$ImplBrandItemSelectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItems(List<int> newValues) {
    final _$actionInfo = _$ImplBrandItemSelectStateActionController.startAction(
        name: 'ImplBrandItemSelectState.selectItems');
    try {
      return super.selectItems(newValues);
    } finally {
      _$ImplBrandItemSelectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
brandItemWidget: ${brandItemWidget},
index: ${index},
indexes: ${indexes}
    ''';
  }
}
