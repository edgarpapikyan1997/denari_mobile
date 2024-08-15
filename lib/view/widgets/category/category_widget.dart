import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final Widget? categoryIcon;
  final CategoriesState categoriesState;
  final VoidCallback? onTap;
  final Color? unselectedColor;
  final Color? borderColor;

  const CategoryWidget(
      {super.key,
      required this.categoryName, this.categoryIcon,
      required this.categoriesState,
      required this.onTap,
      this.unselectedColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Observer(builder: (context) {
        bool isSelected = categoriesState.currentCategory == categoryName;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: borderColor ?? AppColors.borderColor),
            borderRadius: BorderRadius.circular(8.0),
            color: isSelected
                ? AppColors.yellowLight2
                : unselectedColor ?? AppColors.white,
          ),
          child: Row(
            children: [
              categoryIcon ?? const SizedBox(),
               SizedBox(
                width: categoryIcon != null ? 4 : 0,
              ),
              Text(
                categoryName,
                style: context.theme.body1.medium,
              ),
            ],
          ).paddingSymmetric(vertical: 6, horizontal: 12),
        );
      }),
    );
  }
}
