import 'package:denari_app/constants/categories.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';
import 'category.dart';
import 'category_widget.dart';

class CategoryFieldGenerator extends StatelessWidget {
  final List<Category> categories;
  final CategoriesState categoriesState;
  final bool justSelector;
  final Color? unselectedColor;
  final Color? borderColor;
  final bool isRow;
  final VoidCallback? onTap;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
    required this.categoriesState,
    this.justSelector = false,
    this.unselectedColor,
    this.borderColor,
    this.isRow = true,
    this.onTap,
  });

  Widget createWrapCollection({required BuildContext context}) {
    return Observer(
      builder: (_) {
        return Wrap(
          direction: Axis.horizontal,
          spacing: 6,
          runSpacing: 6,
          children: List.generate(
            categories.length,
            (index) {
              final category = categories[index];
              final isSelected =
                  categoriesState.selectedCategories.contains(category.type);
              return ActionChip(
                backgroundColor:
                    isSelected ? AppColors.yellowLight2 : AppColors.whiteGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    width: 0.0,
                    color: Colors.transparent,
                  ),
                ),
                label: Text(
                  category.name,
                  style: context.theme.body1.medium,
                ),
                onPressed: () {
                  if (isSelected) {
                    categoriesState.removeCategory(category.type);
                  } else {
                    categoriesState.addCategory(category.type);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget createRowCollection({required BuildContext context}) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          Category category = entry.value;
          return PaddingUtility.only(
            right: 8,
            child: CategoryWidget(
              categoryName: category.name,
              categoryIcon: category.icon,
              categoriesState: categoriesState,
              unselectedColor: unselectedColor,
              borderColor: borderColor,
              onTap: () {
                if (categoriesState.categoryType == category.type) {
                  categoriesState.unselectCategory();
                } else {
                  categoriesState.selectCategory(
                      categoryName: category.name,
                      newCategoryType: category.type);
                  if (onTap != null) {
                    onTap?.call();
                  }
                  if (justSelector != true &&
                      category.type != CategoryType.all) {
                    context.push('/chosenCategoryScreen',
                        extra: categoriesState);
                  }
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isRow
        ? createRowCollection(context: context)
        : createWrapCollection(context: context);
  }
}
