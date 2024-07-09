import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 72),
            const WelcomeText(),
            const SizedBox(height: 8),
            Text('sign.sms_description'.tr()),
            const SizedBox(height: 24),
            EditField(
              hint: 'sign.email'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            EditField(
              hint: 'sign.password'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            EditField(
              hint: 'sign.phone'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
