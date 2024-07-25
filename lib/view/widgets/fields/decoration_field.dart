import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DecorationField extends InputDecoration {
  final BuildContext context;
  final TextEditingController controller;
  final String? hint;
  final TextStyle? hintStyle;

  DecorationField({
    required this.context,
    required this.controller,
    this.hint,
    this.hintStyle,
    String? error,
  }) : super(
          isDense: true,
          border: FieldBorder(
            borderColor: AppColors.lightGreyText,
            borderRadius: 12.0,
          ),
          focusedBorder: FieldBorder(
            borderColor: AppColors.lightGreyText,
            borderRadius: 12.0,
          ),
          enabledBorder: FieldBorder(
            borderColor: AppColors.lightGreyText,
            borderRadius: 12.0,
          ),
          disabledBorder: FieldBorder(),
          errorBorder: FieldBorder(borderColor: AppColors.errorColor),
          hintText: hint,
          hintStyle: hintStyle ??
              context.theme.headline5.copyWith(
                color: AppColors.hintColor,
              ),
          filled: true,
          fillColor: AppColors.fieldColor,
          errorText: error,
          errorStyle: context.theme.headline5.copyWith(
            color: AppColors.errorColor,
          ),
          suffixIcon: controller.text.isNotEmpty
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
