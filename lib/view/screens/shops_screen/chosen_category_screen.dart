import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/constants/categories.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/shop_tems.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/store_fields/store_field_generator.dart';

class ChosenCategoryScreen extends StatelessWidget {
  final CategoryType? categoryType;
  final String categoryName;

  const ChosenCategoryScreen({
    super.key,
    this.categoryType,
    required this.categoryName,
  });

  Widget getItemsByCategory() {
    switch (categoryType) {
      case CategoryType.all:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: allShops,
        );
      case CategoryType.food:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: foodField,
        );
      case CategoryType.beauty:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: beautyField,
        );
      case CategoryType.clothing:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: clothingField,
        );
      case CategoryType.activities:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: activitiesField,
        );
      case CategoryType.groceries:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: groceriesField,
        );
      case CategoryType.travel:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: travelField,
        );
      case CategoryType.giftCard:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: giftCardField,
        );
      case CategoryType.tokens:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: tokensField,
        );
      case CategoryType.other:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: otherField,
        );
      default:
        return StoreFieldGenerator(
          isGrid: true,
          storeFieldList: [],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          title: Text(
            categoryName,
            style: context.theme.body1.semiBold.black,
          ),
          leadingIcon: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Assets.media.icons.chevronLeft.svg()),
        ),
      ),
      body: PaddingUtility.only(
        left: 16,
        right: 16,
        child: Column(
          children: [
            Expanded(child: getItemsByCategory()),
          ],
        ),
      ),
    );
  }
}
