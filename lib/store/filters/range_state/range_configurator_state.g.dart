// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range_configurator_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RangeConfiguratorState on DistanceConfiguratorImpl, Store {
  Computed<RangeValues>? _$currentRangeValuesComputed;

  @override
  RangeValues get currentRangeValues => (_$currentRangeValuesComputed ??=
          Computed<RangeValues>(() => super.currentRangeValues,
              name: 'DistanceConfiguratorImpl.currentRangeValues'))
      .value;

  late final _$rangeFromAtom =
      Atom(name: 'DistanceConfiguratorImpl.rangeFrom', context: context);

  @override
  int get rangeFrom {
    _$rangeFromAtom.reportRead();
    return super.rangeFrom;
  }

  @override
  set rangeFrom(int value) {
    _$rangeFromAtom.reportWrite(value, super.rangeFrom, () {
      super.rangeFrom = value;
    });
  }

  late final _$rangeToAtom =
      Atom(name: 'DistanceConfiguratorImpl.rangeTo', context: context);

  @override
  int get rangeTo {
    _$rangeToAtom.reportRead();
    return super.rangeTo;
  }

  @override
  set rangeTo(int value) {
    _$rangeToAtom.reportWrite(value, super.rangeTo, () {
      super.rangeTo = value;
    });
  }

  late final _$DistanceConfiguratorImplActionController =
      ActionController(name: 'DistanceConfiguratorImpl', context: context);

  @override
  void configure(int fromDestination, int toDestination) {
    final _$actionInfo = _$DistanceConfiguratorImplActionController.startAction(
        name: 'DistanceConfiguratorImpl.configure');
    try {
      return super.configure(fromDestination, toDestination);
    } finally {
      _$DistanceConfiguratorImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetRange() {
    final _$actionInfo = _$DistanceConfiguratorImplActionController.startAction(
        name: 'DistanceConfiguratorImpl.resetRange');
    try {
      return super.resetRange();
    } finally {
      _$DistanceConfiguratorImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rangeFrom: ${rangeFrom},
rangeTo: ${rangeTo},
currentRangeValues: ${currentRangeValues}
    ''';
  }
}
