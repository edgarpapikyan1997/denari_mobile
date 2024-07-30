import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/data/profile/model/profile.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/store/profile/profile_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/date_field.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({super.key, required this.profile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileState _state = ProfileState(
    authRepository: di.get<AuthRepository>(),
    profileRepository: di.get<ProfileRepository>(),
  );

  @override
  void initState() {
    _state.profile = widget.profile.copyWith();
    _state.email = widget.profile.email;
    _state.birthday = widget.profile.dateOfBirth.toDate();
    _state.phone =
        PhoneNumber.fromCompleteNumber(completeNumber: widget.profile.phone);
    reaction(
      (reaction) => _state.codeSentError,
      (value) {
        if (value == 'true') {
          final profile = Profile(
            name: _state.name,
            email: _state.email,
            phone: _state.phone.print(),
            id: _state.profile.id,
            dateOfBirth: _state.birthday.toString(),
            createdAt: _state.profile.createdAt,
          );
          context.goNamed(Routes.profileCode, extra: profile);
        } else if (value != null) {
          Message.show(value);
        }
      },
      equals: (_, __) => false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: 'profile.data'.tr()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => EditField(
                  value: _state.profile.name,
                  hint: 'sign.name'.tr(),
                  error: !_state.isNameValid ? '' : null,
                  onChanged: _state.setName,
                ),
              ),
              const Delimiter(),
              Observer(
                builder: (_) => PhoneField(
                  hint: 'sign.phone'.tr(),
                  value: _state.profile.phone,
                  error: !_state.isPhoneValid ? 'sign.phone_error'.tr() : null,
                  onChanged: _state.setPhone,
                ),
              ),
              const Delimiter(),
              Observer(
                builder: (_) => EditField(
                  value: _state.profile.email,
                  hint: 'sign.email'.tr(),
                  optional: true,
                  error: !_state.isEmailValid ? 'sign.email_error'.tr() : null,
                  onChanged: _state.setEmail,
                ),
              ),
              const Delimiter(),
              Observer(
                builder: (_) => DateField(
                  value: _state.profile.dateOfBirth.toDate(),
                  hint: 'profile.birthdate'.tr(),
                  error: !_state.isBirthdayValid
                      ? 'profile.birthdate_error'.tr()
                      : null,
                  onChanged: _state.setBirthday,
                ),
              ),
              const Spacer(),
              Observer(
                builder: (_) => Visibility(
                  visible: _state.updateButtonEnabled,
                  child: ButtonPrimary(
                    label: 'profile.save'.tr(),
                    onPressed: _state.getCode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
