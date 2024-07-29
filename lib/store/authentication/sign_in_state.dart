import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_state.g.dart';

class SignInState = _SignInState with _$SignInState;

abstract class _SignInState with Store {
  final AuthRepository _repository;
  final TokenPreferences _tokenPreferences;

  _SignInState({
    required AuthRepository authRepository,
    required TokenPreferences tokenPreferences,
  })  : _repository = authRepository,
        _tokenPreferences = tokenPreferences;

  @observable
  String? signInError;

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
  Future<void> signIn() async {
    loading = true;
    try {
      final token = await _repository.login(
        LoginModel(
          password: password,
          phone: phone?.completeNumber ?? '',
        ),
      );
      _tokenPreferences.setToken(token);
    } catch (e) {
      logger.error(e.toString());
      signInError = e.toString();
    }
    loading = false;
  }
}
