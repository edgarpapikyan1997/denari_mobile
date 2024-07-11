import 'package:flutter/material.dart';
import 'category_widget.dart';

class CategoryFieldGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoryFieldGenerator({
    super.key,
    required this.categories,
  });

  Widget createWidgetCollection() {
    return Row(
      children: categories.map((category) {
        String categoryName = category['categoryName'] as String;
        Widget categoryIcon = category['categoryIcon'] as Widget;
        return CategoryWidget(
          categoryName: categoryName,
          categoryIcon: categoryIcon,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(categories.toString());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: createWidgetCollection(),
    );
  }
}
