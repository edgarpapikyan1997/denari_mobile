import 'package:denari_app/data/authentication/model/reset_pass_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/forgot_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

class CreatePasswordPage extends StatefulWidget {
  final ResetPassModel model;

  const CreatePasswordPage({super.key, required this.model});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final ForgotState _state = ForgotState(
    authRepository: di.get<AuthRepository>(),
  );

  @override
  void initState() {
    _state.phone =
        PhoneNumber.fromCompleteNumber(completeNumber: widget.model.phone);
    _state.code = widget.model.code;
    reaction(
      (reaction) => _state.changePasswordError,
      (value) {
        if (value == 'true') {
          context.goNamed(Routes.signIn);
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
      appBar: const AppBarPage(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sign.create_new_password'.tr(),
                style: context.theme.headline1,
              ),
              const Delimiter(2),
              Text('sign.new_password_description'.tr()),
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
