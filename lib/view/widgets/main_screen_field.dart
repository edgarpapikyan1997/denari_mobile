import 'package:flutter/material.dart';

import '../../utils/themes/app_colors.dart';

class MainScreenField extends StatelessWidget {
  const MainScreenField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
        )
      ],
    );
  }
}
