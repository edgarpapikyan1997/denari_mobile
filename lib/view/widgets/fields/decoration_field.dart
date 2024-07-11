import 'package:denari_app/utils/app_colors.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class DecorationField extends InputDecoration {
  final BuildContext context;
  final TextEditingController controller;
  final String? hint;

  DecorationField({
    required this.context,
    required this.controller,
    this.hint,
  }) : super(
          isDense: true,
          border: FieldBorder(),
          enabledBorder: FieldBorder(),
          disabledBorder: FieldBorder(),
          errorBorder: FieldBorder(borderColor: AppColors.errorColor),
          hintText: hint,
          hintStyle: context.theme.headline5.copyWith(
            color: AppColors.hintColor,
          ),
          filled: true,
          fillColor: AppColors.fieldColor,
          errorStyle: context.theme.headline6.copyWith(
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
  FieldBorder({Color? borderColor})
      : super(
    borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
    borderRadius: BorderRadius.circular(6.0),
  );
}