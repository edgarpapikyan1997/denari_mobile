import 'package:mobx/mobx.dart';

part 'distance_configurator_state.g.dart';

class DistanceConfiguratorState = _DistanceConfiguratorState with _$DistanceConfiguratorState;

abstract class _DistanceConfiguratorState with Store {

  @observable
  int from = 0;

  @observable
  int to = 100;

  @action
  void configure(int fromDestination, int toDestination){
      from = fromDestination;
      to = toDestination;
  }
}
