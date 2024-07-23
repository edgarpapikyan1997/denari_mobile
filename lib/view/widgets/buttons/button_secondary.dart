import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class ButtonSecondary extends StatelessWidget {
  final String? label;
  final String? svgImagePath;
  final Function()? onPressed;
  final FocusNode? focusNode;
  final double? height;
  final double? width;
  final double? dimension;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? fontSize;
  final CrossAxisAlignment? align;

  const ButtonSecondary({
    super.key,
    this.onPressed,
    this.label,
    this.focusNode,
    this.width,
    this.height,
    this.svgImagePath,
    this.dimension,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.align,
  }) : assert(label != null || svgImagePath != null);

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      label: label,
      focusNode: focusNode,
      width: width,
      height: height,
      svg: svgImagePath,
      dimension: dimension,
      buttonColor: context.theme.colorScheme.secondary,
      valuesColor: context.theme.colorScheme.primary,
      borderRadius: borderRadius,
      padding: padding,
      fontSize: fontSize,
      crossAlign: align,
    );
  }
}
