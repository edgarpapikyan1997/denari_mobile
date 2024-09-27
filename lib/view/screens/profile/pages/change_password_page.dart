import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/change_password/change_password_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/screens/profile/widgets/success_operation_sheet.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final ChangePasswordState _state = ChangePasswordState(
    authRepository: di.get<AuthRepository>(),
  );

  @override
  void initState() {
    reaction(
      (reaction) => _state.changePasswordError,
      (value) {
        if (value == 'true') {
          showModalSheet<void>(
            context: context,
            child: SuccessOperationSheet(
                message: 'profile.save_pass_success'.tr()),
          ).then((value) => context.goNamed(Routes.profile));
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
      appBar: AppBarPage(title: 'profile.change_password'.tr()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'profile.enter_valid_password'.tr(),
                style: context.theme.headline2,
              ),
              const Delimiter(24),
              Observer(
                builder: (_) => EditField(
                  hint: 'sign.password'.tr(),
                  obscure: true,
                  error: !_state.isPasswordValid
                      ? 'sign.password_error'.tr()
                      : null,
                  onChanged: _state.setPassword,
                ),
              ),
              const Delimiter(),
              Align(
                alignment: Alignment.topRight,
                child: SelectableText(
                  '${'sign.forgot_password'.tr()}?',
                  style: context.theme.bodyText1.copyWith(
                    color: context.theme.primaryColor,
                  ),
                  onTap: () => context.goNamed(Routes.profileForgot),
                ),
              ),
              const Delimiter(24),
              Text(
                'profile.enter_new_password'.tr(),
                style: context.theme.headline2,
              ),
              const Delimiter(24),
              Observer(
                builder: (_) => EditField(
                  hint: 'sign.password'.tr(),
                  obscure: true,
                  error: !_state.isNewPasswordValid
                      ? 'sign.password_error'.tr()
                      : null,
                  onChanged: _state.setNewPassword,
                ),
              ),
              const Delimiter(),
              Observer(
                builder: (_) => EditField(
                  hint: 'sign.confirm_password'.tr(),
                  obscure: true,
                  error: !(_state.password == _state.passwordRepeat)
                      ? 'sign.password_mismatch'.tr()
                      : null,
                  onChanged: _state.setPasswordRepeat,
                ),
              ),
              const Spacer(),
              Observer(
                builder: (_) => ButtonPrimary(
                  label: 'sign.save_new_password'.tr(),
                  onPressed:
                      _state.changeButtonEnabled ? _state.changePassword : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
