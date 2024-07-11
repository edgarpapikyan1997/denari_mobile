import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_outline.dart';
import 'package:flutter/material.dart';

class ButtonGoogle extends StatelessWidget {
  final Function()? onPressed;
  const ButtonGoogle({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonOutline(
      label: 'sign.with_google'.tr(),
      svg: 'google_icon',
      onPressed: onPressed,
    );
  }
}
