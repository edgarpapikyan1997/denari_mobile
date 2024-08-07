import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool isEnabled;
  final bool isWhite;
  final String title;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.isWhite,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: context.width,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
            color: isEnabled
                ? isWhite
                ? AppColors.white
                : AppColors.black
                : AppColors.greyLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: isEnabled ? 1 : 0,
                color: isEnabled ? AppColors.black : AppColors.white)),
        // width: context.width,
        child: Center(
          child: Text(
            title,
            style: isEnabled
                ? isWhite
                ? context.theme.headline4
                : context.theme.headline4.white
                : context.theme.headline4.lightGreyText,
          ),
        ),
      ),
    );
  }
}
