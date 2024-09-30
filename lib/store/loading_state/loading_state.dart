import 'package:mobx/mobx.dart';

part 'loading_state.g.dart';

class LoadingState = ImplLoadingState with _$LoadingState;

abstract class ImplLoadingState with Store {
  @observable
  bool isLoading = false;

  @action
  void startLoading() {
    isLoading = true;
  }

  @action
  void stopLoading() {
    isLoading = false;
  }
}