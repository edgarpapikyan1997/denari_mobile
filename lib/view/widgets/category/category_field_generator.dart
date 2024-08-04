import 'package:denari_app/constants/categories.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../store/categories_state/categories_state.dart';
import 'category.dart';
import 'category_widget.dart';

class CategoryFieldGenerator extends StatelessWidget {
  final List<Category> categories;
  final CategoriesState categoriesState;
  final bool justSelector;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
    required this.categoriesState,
    this.justSelector = false
  });

  Widget createWidgetCollection({required BuildContext context}) {
    return Row(
      children: categories.asMap().entries.map((entry) {
        int index = entry.key;
        Category category = entry.value;
        return PaddingUtility.only(
          right: index == categories.length - 1 ? 0 : 8,
          child: CategoryWidget(
              categoryName: category.name,
              categoryIcon: category.icon,
              categoriesState: categoriesState,
              onTap: () {
                print(categoriesState);
                categoriesState.selectCategory(
                    categoryName: category.name,
                    newCategoryType: category.type);
                if (justSelector != true && category.type != CategoryType.all) {
                  context.push(
                      '/chosenCategoryScreen',
                      extra: categoriesState
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
