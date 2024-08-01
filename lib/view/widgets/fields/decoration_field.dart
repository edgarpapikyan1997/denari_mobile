import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DecorationField extends InputDecoration {
  final BuildContext context;
  final TextEditingController controller;
  final String? hint;
  final double? borderRadius;
  final bool? obscure;
  final ValueChanged<bool>? onObscured;

  DecorationField({
    required this.context,
    required this.controller,
    this.hint,
    this.borderRadius,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    String? error,
    this.obscure,
    this.onObscured,
  }) : super(
    isDense: true,
    border: FieldBorder(
      borderColor: AppColors.whiteGrey,
      borderRadius: borderRadius,
    ),
    enabledBorder: FieldBorder(
      borderColor: AppColors.greyLight,
      borderRadius: borderRadius,
    ),
    focusedBorder: FieldBorder(
      borderColor: AppColors.yellowDark,
      borderRadius: borderRadius,
    ),
    disabledBorder: FieldBorder(
      borderColor: AppColors.lightGreyText,
      borderRadius: borderRadius,
    ),

    errorBorder: FieldBorder(borderColor: AppColors.errorColor),
    hintText: hint,
    hintStyle: hintStyle ?? context.theme.body1.copyWith(
      color: AppColors.hintColor,
    ),
    filled: true,
    fillColor: AppColors.fieldColor,
    errorText: controller.text.isNotEmpty ? error : null,
    errorStyle: context.theme.body1.copyWith(
      color: AppColors.errorColor,
    ),
    suffixIcon: onObscured != null && controller.text.isNotEmpty
        ? IconButton(
      icon: Icon(
        obscure == true
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
      ),
      iconSize: 24,
      onPressed: () => onObscured.call(!(obscure ?? true)),
    )
        : controller.text.isNotEmpty
        ? IconButton(
      icon: const Icon(Icons.clear),
      iconSize: 24,
      onPressed: controller.clear,
    )
        : null,
  );
}

class FieldBorder extends OutlineInputBorder {
  FieldBorder({
    Color? borderColor,
    double? borderRadius,
  }) : super(
    borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
    borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
  );
}