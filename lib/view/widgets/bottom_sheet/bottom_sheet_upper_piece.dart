import 'package:flutter/material.dart';

import '../../../utils/themes/app_colors.dart';

class BottomSheetUpperPiece extends StatelessWidget {
  const BottomSheetUpperPiece({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(bottom: 4),
      // margin: const EdgeInsets.only(bottom: 4),
      height: 4,
      width: 40,
      decoration: BoxDecoration(
          color: AppColors.bottomSheetPieceGrey,
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
