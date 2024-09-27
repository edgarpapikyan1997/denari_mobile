import 'package:denari_app/data/authentication/model/change_pass_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'change_password_state.g.dart';

class ChangePasswordState = ImplChangePasswordState with _$ChangePasswordState;

abstract class ImplChangePasswordState with Store {
  final AuthRepository _repository;

  ImplChangePasswordState({required AuthRepository authRepository})
      : _repository = authRepository;

  @observable
  String? changePasswordError;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  String newPassword = "";

  @action
  void setNewPassword(String value) => newPassword = value;

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
  String? codeSent;

  @computed
  bool get isPasswordValid => password.length >= 8;

  @computed
  bool get isNewPasswordValid => password.length >= 8;

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
      isPasswordValid &&
      isNewPasswordValid &&
      newPassword == passwordRepeat &&
      !loading;

  @computed
  bool get sendButtonEnabled => isPhoneValid && !loading;

  @action
  Future<void> changePassword() async {
    loading = true;
    final model = ChangePassModel(
      oldPassword: password,
      newPassword: newPassword,
    );
    (await handle(() => _repository.changePassword(model))).then(
      (data) => changePasswordError = 'true',
      (error) => changePasswordError = error,
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
