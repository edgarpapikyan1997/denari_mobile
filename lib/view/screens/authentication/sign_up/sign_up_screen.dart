import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/sign_up_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/text_with_link.dart';
import 'package:denari_app/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpState _state =
      SignUpState(authRepository: di.get<AuthRepository>());

  @override
  void initState() {
    reaction(
      (reaction) => _state.isCodeSent,
      (value) => switch (value) {
        null => null,
        true => context.goNamed(Routes.code, extra: _state.phone),
        false => showBottomSheet(
            context: context,
            builder: (_) => const Text('invalid data'),
          ),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => _state,
      child: Scaffold(
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
                  builder: (_) => EditField(
                    hint: 'sign.name'.tr(),
                    error: !_state.isNameValid ? '' : null,
                    onChanged: _state.setName,
                  ),
                ),
                const Delimiter(),
                Observer(
                  builder: (_) => PhoneField(
                    hint: 'sign.phone'.tr(),
                    error:
                        !_state.isPhoneValid ? 'sign.phone_error'.tr() : null,
                    onChanged: _state.setPhone,
                  ),
                ),
                const Delimiter(),
                Observer(
                  builder: (_) => EditField(
                    hint: 'sign.password'.tr(),
                    error: !_state.isPasswordValid
                        ? 'sign.password_error'.tr()
                        : null,
                    onChanged: _state.setPassword,
                  ),
                ),
                const Delimiter(),
                Observer(
                  builder: (_) => EditField(
                    hint: 'sign.email'.tr(),
                    optional: true,
                    error:
                        !_state.isEmailValid ? 'sign.email_error'.tr() : null,
                    onChanged: _state.setEmail,
                  ),
                ),
                const Delimiter(24),
                Observer(
                  builder: (_) => ButtonPrimary(
                    label: 'sign.create_now'.tr(),
                    onPressed:
                        _state.createButtonEnabled ? _state.getCode : null,
                  ),
                ),
                const Delimiter(),
                Center(
                  child: TextWithLink(
                    text: 'sign.already_account'.tr(),
                    link: 'sign.in'.tr(),
                    onTap: () => context.goNamed(Routes.signIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
