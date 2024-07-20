import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_state.g.dart';

class SignUpState = _SignUpState with _$SignUpState;

abstract class _SignUpState with Store {
  final AuthRepository _repository;

  _SignUpState({required AuthRepository authRepository})
      : _repository = authRepository;

  @observable
  bool? isSignUp;

  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @observable
  String email = "";

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
  bool? isCodeSent;

  @computed
  bool get isNameValid => name.isNotEmpty;

  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email) ||
      email.isEmpty;

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
  bool get isCodeValid => code.length == 6;

  @computed
  bool get createButtonEnabled =>
      isNameValid && isEmailValid && isPasswordValid && isPhoneValid && !loading;

  @action
  Future<void> signUp() async {
    loading = true;
    try {
      isSignUp = await _repository.register(
        RegModel(
          name: name,
          email: email,
          password: password,
          phone: phone?.completeNumber ?? '',
          code: code,
        ),
      );
    } catch (e) {
      logger.error(e.toString());
      isSignUp = false;
    }
    loading = false;
  }

  @action
  Future<void> getCode() async {
    loading = true;
    try {
      isCodeSent = await _repository.verify(phone?.completeNumber ?? '');
    } catch (e) {
      logger.error(e.toString());
      isCodeSent = false;
    }
    loading = false;
  }
}
