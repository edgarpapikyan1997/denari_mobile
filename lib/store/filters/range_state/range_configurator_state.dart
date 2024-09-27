import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'range_configurator_state.g.dart';

class RangeConfiguratorState = DistanceConfiguratorImpl
    with _$RangeConfiguratorState;

abstract class DistanceConfiguratorImpl with Store {
  @observable
  int rangeFrom = 0;

  @observable
  int rangeTo = 100;

  @computed
  RangeValues get currentRangeValues =>
      RangeValues(rangeFrom.toDouble(), rangeTo.toDouble());

  @action
  void configure(int fromDestination, int toDestination) {
    rangeFrom = fromDestination;
    rangeTo = toDestination;
  }

  @action
  void resetRange() {
    rangeFrom = 0;
    rangeTo = 10000;
  }
}
