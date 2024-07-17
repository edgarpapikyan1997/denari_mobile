import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/phone_field.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
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
              PhoneField(
                hint: 'sign.phone'.tr(),
                onChanged: (value) {},
              ),
              const Spacer(),
              ButtonPrimary(
                label: 'sign.send'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
