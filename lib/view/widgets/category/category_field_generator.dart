import 'package:flutter/material.dart';
import '../../../store/categories_state/categories_state.dart';
import 'category_widget.dart';

class CategoryFieldGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final CategoriesState categoriesState;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
    required this.categoriesState,
  });

  Widget createWidgetCollection() {
    return Row(
      children: categories.map((category) {
        String categoryName = category['categoryName'] as String;
        Widget categoryIcon = category['categoryIcon'] as Widget;
        return CategoryWidget(
            categoryName: categoryName,
            categoryIcon: categoryIcon,
            categoriesState: categoriesState,
            onTap: () {
              categoriesState.selectCategory(categoryName);
            });
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: createWidgetCollection(),
    );
  }
}
