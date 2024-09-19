import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'distance_configurator_state.g.dart';

class DistanceConfiguratorState = DistanceConfiguratorImpl with _$DistanceConfiguratorState;

abstract class DistanceConfiguratorImpl with Store {

  @observable
  int from = 0;

  @observable
  int to = 100;

  @computed
  RangeValues get currentRangeValues => RangeValues(from.toDouble(), to.toDouble());

  @action
  void configure(int fromDestination, int toDestination) {
    from = fromDestination;
    to = toDestination;
  }
}
