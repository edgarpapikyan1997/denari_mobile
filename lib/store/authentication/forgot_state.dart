import 'package:denari_app/data/authentication/model/reset_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'forgot_state.g.dart';

class ForgotState = _ForgotState with _$ForgotState;

abstract class _ForgotState with Store {
  final AuthRepository _repository;

  _ForgotState({required AuthRepository authRepository})
      : _repository = authRepository;

  @observable
  String? changePasswordError;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  String passwordRepeat = "";

  @action
  void setPasswordRepeat(String value) => passwordRepeat = value;

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
  String? codeSentError;

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
  bool get isCodeValid => code.length >= 6;

  @computed
  bool get changeButtonEnabled =>
      isPasswordValid && password == passwordRepeat && isPhoneValid && !loading;

  @computed
  bool get sendButtonEnabled => isPhoneValid && !loading;

  @action
  Future<void> changePassword() async {
    loading = true;
    try {
      await _repository.reset(
        ResetModel(
          newPassword: password,
          phone: phone?.completeNumber ?? '',
          code: code,
        ),
      );
      changePasswordError = null;
    } catch (e) {
      logger.error(e.toString());
      changePasswordError = e.toString();
    }
    loading = false;
  }

  @action
  Future<void> getCode() async {
    loading = true;
    try {
      await _repository.verify(phone?.completeNumber ?? '');
      codeSentError = null;
    } catch (e) {
      logger.error(e.toString());
      codeSentError = e.toString();
    }
    loading = false;
  }
}
