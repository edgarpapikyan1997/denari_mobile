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
        width: context.width,
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
            color: isEnabled
                ? AppColors.greyLight
                : isWhite
                    ? AppColors.white
                    : AppColors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
            )),
        // width: context.width,
        child: Center(
          child: Text(
            title,
            style: isEnabled
                ? context.theme.headline4.lightGreyText
                : isWhite
                    ? context.theme.headline4
                    : context.theme.headline4.white,
          ),
        ),
      ),
    );
  }
}
