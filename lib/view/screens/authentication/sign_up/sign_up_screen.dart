import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/text_with_link.dart';
import 'package:denari_app/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              EditField(
                hint: 'sign.name'.tr(),
                onChanged: (value) {},
              ),
              const Delimiter(),
              PhoneField(
                hint: 'sign.phone'.tr(),
                onChanged: (value) {},
              ),
              const Delimiter(),
              EditField(
                hint: 'sign.password'.tr(),
                onChanged: (value) {},
              ),
              const Delimiter(),
              EditField(
                hint: 'sign.email'.tr(),
                optional: true,
                onChanged: (value) {},
              ),
              const Delimiter(24),
              ButtonPrimary(
                label: 'sign.create_now'.tr(),
                onPressed: () => context.goNamed(Routes.code, extra: '+44442344'),
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
    );
  }
}
