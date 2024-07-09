import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'sign.welcome_to'.tr()),
          const WidgetSpan(child: SizedBox.square(dimension: 6)),
          TextSpan(text: 'app_name'.tr()),
        ],
      ),
    );
  }
}
