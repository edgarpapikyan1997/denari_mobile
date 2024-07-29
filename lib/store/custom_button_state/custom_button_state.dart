import 'package:mobx/mobx.dart';

part 'custom_button_state.g.dart';

class CustomButtonState = _CustomButtonState with _$CustomButtonState;

abstract class _CustomButtonState with Store {
  @observable
  bool isButtonEnabled = false;


  @observable
  int index = 0;

  @action
  void updateButton(bool newValue){
    isButtonEnabled = newValue;
  }
}
