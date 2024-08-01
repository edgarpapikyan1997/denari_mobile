import 'package:denari_app/data/authentication/model/reset_pass_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/forgot_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final ForgotState _state = ForgotState(
    authRepository: di.get<AuthRepository>(),
  );

  @override
  void initState() {
    reaction(
      (reaction) => _state.codeSent,
      (value) {
        if (value == 'true') {
          context.goNamed(
            Routes.forgotCode,
            extra: ResetPassModel(
              phone: _state.phone!.completeNumber,
              code: '',
              newPassword: '',
            ),
          );
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
                'sign.forgot_password'.tr(),
                style: context.theme.headline1,
              ),
              const Delimiter(2),
              Text('sign.forgot_description'.tr()),
              const Delimiter(24),
              Observer(
                builder: (_) => PhoneField(
                  hint: 'sign.phone'.tr(),
                  error: !_state.isPhoneValid ? 'sign.phone_error'.tr() : null,
                  onChanged: _state.setPhone,
                ),
              ),
              const Spacer(),
              Observer(
                builder: (_) => ButtonPrimary(
                  label: 'sign.send'.tr(),
                  onPressed: _state.sendButtonEnabled ? _state.getCode : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
