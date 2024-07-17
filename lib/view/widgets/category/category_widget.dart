import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../utils/themes/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final Widget categoryIcon;

  const CategoryWidget(
      {super.key, required this.categoryName, required this.categoryIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          categoryIcon,
          const SizedBox(width: 4,),
          Text(
            categoryName,
            style: context.theme.body1,
          ),
        ],
      ).paddingSymmetric(vertical: 6, horizontal: 12),
    ).paddingHorizontal(4);
  }
}
