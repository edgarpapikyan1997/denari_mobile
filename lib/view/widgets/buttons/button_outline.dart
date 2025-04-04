import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class ButtonOutline extends StatelessWidget {
  final String? label;
  final String? svg;
  final Function()? onPressed;
  final FocusNode? focusNode;
  final double? height;
  final double? width;
  final double? dimension;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? fontSize;
  final CrossAxisAlignment? align;

  const ButtonOutline({
    super.key,
    this.onPressed,
    this.label,
    this.focusNode,
    this.width,
    this.height,
    this.svg,
    this.dimension,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.align,
  }) : assert(label != null || svg != null);

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      label: label,
      focusNode: focusNode,
      width: width,
      height: height,
      svg: svg,
      dimension: dimension,
      buttonColor: Colors.transparent,
      borderColor: AppColors.black,
      valuesColor: AppColors.black,
      borderRadius: borderRadius,
      padding: padding,
      fontSize: fontSize,
      crossAlign: align,
    );
  }
}
