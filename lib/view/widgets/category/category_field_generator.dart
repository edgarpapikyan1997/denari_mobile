import 'package:denari_app/constants/categories.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../store/categories_state/categories_state.dart';
import 'category.dart';
import 'category_widget.dart';

class CategoryFieldGenerator extends StatefulWidget {
  final List<Category> categories;
  final CategoriesState categoriesState;
  final bool justSelector;
  final Color? unselectedColor;
  final Color? borderColor;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
    required this.categoriesState,
    this.justSelector = false,
    this.unselectedColor,
    this.borderColor,
  });

  @override
  State<CategoryFieldGenerator> createState() => _CategoryFieldGeneratorState();
}

class _CategoryFieldGeneratorState extends State<CategoryFieldGenerator> {
  Widget createWidgetCollection({required BuildContext context}) {
    return Row(
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
                  context.push(
                    '/chosenCategoryScreen',
                    extra: widget.categoriesState
                  );
                }
              }),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: createWidgetCollection(context: context),
    );
  }
}
