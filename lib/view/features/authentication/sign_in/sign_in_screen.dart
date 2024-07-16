import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:denari_app/view/widgets/text_with_link.dart';
import 'package:denari_app/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              SelectableText(
                '${'sign.forgot_password'.tr()}?',
                style: context.theme.bodyText1.copyWith(
                  color: context.theme.primaryColor,
                ),
                onTap: () => {},
              ),
              const Delimiter(24),
              ButtonPrimary(
                label: 'sign.log_in'.tr(),
              ),
              const Delimiter(),
              Center(
                child: TextWithLink(
                  text: 'sign.don_t_account'.tr(),
                  link: 'sign.up'.tr(),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
