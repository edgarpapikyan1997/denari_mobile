import 'package:denari_app/utils/app_colors.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: context.theme.headline1,
        children: [
          TextSpan(
            text: 'sign.welcome_to'.tr(),
            style: const TextStyle(
              color: AppColors.dark,
            ),
          ),
          const WidgetSpan(child: Delimiter(6)),
          TextSpan(
            text: 'app_name'.tr(),
            style: const TextStyle(
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
