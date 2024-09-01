import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_state.g.dart';

class SignUpState = ImplSignUpState with _$SignUpState;

abstract class ImplSignUpState with Store {
  final AuthRepository _repository;
  final TokenPreferences _tokenPreferences;

  ImplSignUpState({
    required AuthRepository authRepository,
    required TokenPreferences tokenPreferences,
  })  : _repository = authRepository,
        _tokenPreferences = tokenPreferences;

  @observable
  String? signUp;

  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @observable
  String? email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  PhoneNumber? phone;

  @action
  void setPhone(PhoneNumber value) => phone = value;

  @observable
  String code = "";

  @action
  void setCode(String value) => code = value;

  @observable
  bool loading = false;

  @observable
  String? codeSent;

  @computed
  bool get isNameValid => name.isNotEmpty;

  @computed
  bool get isEmailValid {
    if (email == null) {
      email = "";
    }
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email!) ||
        email!.isEmpty;
    return true;
  }

  @computed
  bool get isPasswordValid => password.length >= 8;

  @computed
  bool get isPhoneValid {
    try {
      return phone?.isValidNumber() ?? false;
    } catch (e) {
      return false;
    }
  }

  @computed
  bool get createButtonEnabled =>
      isNameValid &&
      isEmailValid &&
      isPasswordValid &&
      isPhoneValid &&
      !loading;

  @action
  Future<void> register() async {
    if (!createButtonEnabled) return;

    loading = true;
    final model = RegModel(
      name: name,
      email: email == null || email!.isEmpty ? "" : email,
      password: password,
      phone: phone.print(),
      code: code,
    );
    (await handle(() => _repository.register(model))).then(
      (data) {
        _tokenPreferences.setToken(data);
        signUp = 'true';
      },
      (error) => signUp = error,
    );
    loading = false;
  }

  @action
  Future<void> getCode() async {
    loading = true;
    (await handle(() => _repository.verify(phone.print()))).then(
      (data) => codeSent = 'true',
      (error) => codeSent = error,
    );
    loading = false;
  }
}
