import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final String svg;
  final Function()? onPressed;
  final FocusNode? focusNode;
  final double? dimension;
  final Color? buttonColor;
  final Color? iconColor;
  final double? iconSize;

  const ButtonIcon({
    super.key,
    required this.svg,
    this.onPressed,
    this.focusNode,
    this.dimension = 32,
    this.buttonColor,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      focusNode: focusNode,
      svg: svg,
      dimension: dimension,
      borderRadius: 100,
      innerPadding: 0,
      iconSize: iconSize ?? 18,
      padding: EdgeInsets.zero,
      buttonColor: buttonColor ?? AppColors.white,
      iconColor: iconColor ?? AppColors.yellowLight2,
    );
  }
}
