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

class CategoryFieldGenerator extends StatefulWidget {
  final List<Category> categories;
  final CategoriesState categoriesState;
  final bool justSelector;
  final Color? unselectedColor;
  final Color? borderColor;
  final bool isRow;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
    required this.categoriesState,
    this.justSelector = false,
    this.unselectedColor,
    this.borderColor,
    this.isRow = true,
  });

  @override
  State<CategoryFieldGenerator> createState() => _CategoryFieldGeneratorState();
}

class _CategoryFieldGeneratorState extends State<CategoryFieldGenerator> {
  Widget createWrapCollection({required BuildContext context}) {
    return Observer(
      builder: (_) {
        return Wrap(
          direction: Axis.horizontal,
          spacing: 6,
          runSpacing: 6,
          children: List.generate(
            widget.categories.length,
            (index) {
              final category = widget.categories[index];
              final isSelected = widget.categoriesState.selectedCategories
                  .contains(category.type);

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
                    widget.categoriesState.removeCategory(category.type);
                  } else {
                    widget.categoriesState.addCategory(category.type);
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
        children: widget.categories.asMap().entries.map((entry) {
          int index = entry.key;
          Category category = entry.value;
          return PaddingUtility.only(
            right: index == widget.categories.length - 1 ? 0 : 8,
            child: CategoryWidget(
              categoryName: category.name,
              categoryIcon: category.icon,
              categoriesState: widget.categoriesState,
              unselectedColor: widget.unselectedColor,
              borderColor: widget.borderColor,
              onTap: () {
                widget.categoriesState.selectCategory(
                    categoryName: category.name,
                    newCategoryType: category.type);
                if (widget.justSelector != true &&
                    category.type != CategoryType.all) {
                  context.push('/chosenCategoryScreen',
                      extra: widget.categoriesState);
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
    return widget.isRow
        ? createRowCollection(context: context)
        : createWrapCollection(context: context);
  }
}
