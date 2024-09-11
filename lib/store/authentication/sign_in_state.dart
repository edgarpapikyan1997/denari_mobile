import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_state.g.dart';

class SignInState = ImplSignInState with _$SignInState;

abstract class ImplSignInState with Store {
  final AuthRepository _repository;
  final TokenPreferences _tokenPreferences;

  ImplSignInState({
    required AuthRepository authRepository,
    required TokenPreferences tokenPreferences,
  })  : _repository = authRepository,
        _tokenPreferences = tokenPreferences;

  @observable
  String? signIn;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  PhoneNumber? phone;

  @action
  void setPhone(PhoneNumber value) => phone = value;

  @observable
  bool loading = false;

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
  bool get loginButtonEnabled => isPasswordValid && isPhoneValid && !loading;

  @action
  Future<void> login() async {
    loading = true;
    final model = LoginModel(
      password: password,
      phone: phone.print(),
    );
    (await handle(() => _repository.login(model))).then(
      (data) {
        _tokenPreferences.setToken(data);
        signIn = 'true';
      },
      (error) => signIn = error,
    );
    loading = false;
  }
}
