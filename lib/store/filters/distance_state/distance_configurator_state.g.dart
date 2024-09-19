// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_configurator_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DistanceConfiguratorState on DistanceConfiguratorImpl, Store {
  Computed<RangeValues>? _$currentRangeValuesComputed;

  @override
  RangeValues get currentRangeValues => (_$currentRangeValuesComputed ??=
          Computed<RangeValues>(() => super.currentRangeValues,
              name: 'DistanceConfiguratorImpl.currentRangeValues'))
      .value;

  late final _$fromAtom =
      Atom(name: 'DistanceConfiguratorImpl.from', context: context);

  @override
  int get from {
    _$fromAtom.reportRead();
    return super.from;
  }

  @override
  set from(int value) {
    _$fromAtom.reportWrite(value, super.from, () {
      super.from = value;
    });
  }

  late final _$toAtom =
      Atom(name: 'DistanceConfiguratorImpl.to', context: context);

  @override
  int get to {
    _$toAtom.reportRead();
    return super.to;
  }

  @override
  set to(int value) {
    _$toAtom.reportWrite(value, super.to, () {
      super.to = value;
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
  String toString() {
    return '''
from: ${from},
to: ${to},
currentRangeValues: ${currentRangeValues}
    ''';
  }
}
