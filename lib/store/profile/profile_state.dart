import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/data/profile/model/profile.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

part 'profile_state.g.dart';

class ProfileState = _ProfileState with _$ProfileState;

abstract class _ProfileState with Store {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  _ProfileState({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  })  : _authRepository = authRepository,
        _profileRepository = profileRepository;

  @observable
  Profile profile = Profile.fromJson({});

  @observable
  String? getError;

  @observable
  String? updateError;

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
  DateTime? birthday;

  @action
  void setBirthday(DateTime value) => birthday = value;

  @observable
  String code = "";

  @action
  void setCode(String value) => code = value;

  @observable
  bool loading = false;

  @observable
  bool isCodeValid = false;

  @observable
  String? codeSentError;

  @computed
  bool get isNameValid => name.isNotEmpty;

  @computed
  bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
  bool get isBirthdayValid => birthday != null;

  @computed
  bool get updateButtonEnabled =>
      isNameValid &&
      isEmailValid &&
      isBirthdayValid &&
      isPhoneValid &&
      isBirthdayValid &&
      !loading;

  @action
  Future<void> getProfile() async {
    loading = true;
    try {
      final gProfile = await _profileRepository.getProfile();
      getError = null;
      profile = gProfile;
    } catch (e) {
      logger.error(e.toString());
      getError = e.toString();
    }
    loading = false;
  }

  @action
  Future<void> updateProfile() async {
    loading = true;
    try {
      final uProfile = Profile(
        userName: name,
        email: email,
        phone: phone?.completeNumber ?? '',
        id: profile.id,
        isVerified: profile.isVerified,
        dateOfBirth: birthday.toString(),
        createdAt: profile.createdAt,
      );
      await _profileRepository.updateProfile(uProfile);
      updateError = null;
      profile = uProfile;
    } catch (e) {
      logger.error(e.toString());
      updateError = e.toString();
    }
    loading = false;
  }

  @action
  Future<void> getCode() async {
    loading = true;
    try {
      await _authRepository.verify(phone?.completeNumber ?? '');
      codeSentError = null;
    } catch (e) {
      logger.error(e.toString());
      codeSentError = e.toString();
    }
    loading = false;
  }
}
