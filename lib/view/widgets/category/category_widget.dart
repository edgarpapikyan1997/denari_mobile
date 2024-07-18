import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final Widget categoryIcon;
  final CategoriesState categoriesState;

  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoriesState,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        categoriesState.selectCategory(categoryName);
      },
      child: Observer(
          builder: (context) {
            bool isSelected = categoriesState.selectedCategory == categoryName;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(8.0),
                color: isSelected ? AppColors.yellowLight2 : AppColors.white,
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
      ),
    );
  }
}
