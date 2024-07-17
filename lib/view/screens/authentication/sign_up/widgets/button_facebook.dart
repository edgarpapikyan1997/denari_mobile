import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_outline.dart';
import 'package:flutter/material.dart';

class ButtonFacebook extends StatelessWidget {
  final Function()? onPressed;
  const ButtonFacebook({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonOutline(
      label: 'sign.with_facebook'.tr(),
      svg: 'facebook_icon',
      onPressed: onPressed,
    );
  }
}
