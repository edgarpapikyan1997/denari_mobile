import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Popover extends StatelessWidget {
  const Popover({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.bottomSheetPieceGrey,
        ),
        child: const SizedBox(height: 4, width: 40),
      ),
    );
  }
}
