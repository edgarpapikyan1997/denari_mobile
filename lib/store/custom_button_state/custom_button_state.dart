import 'package:mobx/mobx.dart';

part 'custom_button_state.g.dart';

class CustomButtonState = ImplCustomButtonState with _$CustomButtonState;

abstract class ImplCustomButtonState with Store {
  @observable
  bool isButtonEnabled = false;


  @observable
  int index = 0;

  @action
  void updateButton(bool newValue){
    isButtonEnabled = newValue;
  }

  @observable
  bool isPressed = false;

  Future<void> onTap() async {
      isPressed = !isPressed;
       const Duration(microseconds: 300);
      isPressed = !isPressed;

  }


}
