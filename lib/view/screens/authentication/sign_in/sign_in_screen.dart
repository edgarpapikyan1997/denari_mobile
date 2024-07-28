import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/sign_in_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/listeners/auth_listener.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:denari_app/view/widgets/text_with_link.dart';
import 'package:denari_app/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInState _state = SignInState(
    authRepository: di.get<AuthRepository>(),
    tokenPreferences: di.get<TokenPreferences>(),
  );

  @override
  void initState() {
    reaction(
      (reaction) => _state.signInError,
      (value) {
        if (value == null) {
          authListener.login();
        } else {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Delimiter(74),
              const WelcomeText(),
              const Delimiter(2),
              Text('sign.sms_description'.tr()),
              const Delimiter(24),
              Observer(
                builder: (_) => PhoneField(
                  hint: 'sign.phone'.tr(),
                  error: !_state.isPhoneValid ? 'sign.phone_error'.tr() : null,
                  onChanged: _state.setPhone,
                ),
              ),
              const Delimiter(),
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
                  onTap: () => context.goNamed(Routes.forgot),
                ),
              ),
              const Delimiter(24),
              Observer(
                builder: (_) => ButtonPrimary(
                  label: 'sign.log_in'.tr(),
                  onPressed: _state.loginButtonEnabled ? _state.signIn : null,
                ),
              ),
              const Delimiter(),
              Center(
                child: TextWithLink(
                  text: 'sign.don_t_account'.tr(),
                  link: 'sign.up'.tr(),
                  onTap: () => context.goNamed(Routes.signUp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
