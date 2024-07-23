import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  final String? label;
  final String? svg;
  final Function()? onPressed;
  final FocusNode? focusNode;
  final double? height;
  final double? width;
  final double? dimension;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? valuesColor;
  final Color? iconColor;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? fontSize;
  final CrossAxisAlignment crossAlign;
  final Alignment mainAlign;
  final double elevation;
  final double innerPadding;

  const Button({
    super.key,
    this.onPressed,
    this.label,
    this.focusNode,
    double? width,
    double? height,
    this.svg,
    this.dimension,
    this.buttonColor,
    this.borderColor,
    this.valuesColor,
    this.iconColor,
    double? borderRadius,
    this.padding,
    this.fontSize,
    CrossAxisAlignment? crossAlign,
    Alignment? mainAlign,
    double? elevation,
    double? innerPadding,
  })  : assert(label != null || svg != null),
        borderRadius = borderRadius ?? 6.0,
        crossAlign = crossAlign ?? CrossAxisAlignment.center,
        mainAlign = mainAlign ?? Alignment.center,
        width = width ?? 500.0,
        height = height ?? 40.0,
        elevation = elevation ?? 0.0,
        innerPadding = innerPadding ?? 8.0;

  @override
  Widget build(BuildContext context) {
    final color = buttonColor ?? context.theme.colorScheme.primary;
    final colorDisableColor = color.withOpacity(0.15);
    final bordColor = borderColor;
    final textColor = valuesColor ?? Colors.white;
    final textDisableColor = textColor.withOpacity(0.15);
    final elevation = color == Colors.transparent ? 0.0 : this.elevation;
    final icColor = iconColor ?? textColor;
    return SizedBox(
      height: dimension ?? height,
      width: dimension ?? width,
      child: MaterialButton(
        focusNode: focusNode,
        textColor: textColor,
        disabledTextColor: textDisableColor,
        color: color,
        disabledColor: colorDisableColor,
        shape: RoundedRectangleBorder(
          side: bordColor != null
              ? BorderSide(color: bordColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        onPressed: onPressed,
        elevation: elevation,
        focusElevation: elevation,
        hoverElevation: elevation,
        highlightElevation: elevation,
        disabledElevation: elevation,
        child: Align(
          alignment: mainAlign,
          child: Row(
            crossAxisAlignment: crossAlign,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (svg != null)
                SvgPicture.asset(
                  svg!,
                  fit: BoxFit.fitHeight,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    onPressed != null ? icColor : textDisableColor,
                    BlendMode.srcIn,
                  ),
                ),
              if (svg != null && label != null)
                SizedBox(width: innerPadding),
              Flexible(
                child: Text(
                  label ?? '',
                  overflow: TextOverflow.clip,
                  style: context.theme.bodyText1.copyWith(
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
