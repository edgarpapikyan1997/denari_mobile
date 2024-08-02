import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/category/category_field_generator.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../widgets/category/category.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/store_fields/store_field_generator.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  final LoadingState _loadingState = LoadingState();
  final CategoriesState categoriesState = CategoriesState();
  late final List<Category> categories;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initCategories() {
    categoriesState.selectCategory(categories[0].name);
  }

  void initPrefs() {
    // categoriesState.setColor(AppColors.black);
    _loadingState.startLoading();
    categories = [
      Category(type: CategoryType.all, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.food, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.beauty, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.clothing, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.activities, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.groceries, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.travel, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.other, iconColor: categoriesState.itemColor),
    ];
    initCategories();
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 104),
        child: CustomAppBar(
          title: Text(
            'shops.shops'.tr(),
            style: context.theme.body1.semiBold.black,
          ),
          tealIcon: Assets.media.icons.search.svg(),
        ),
      ),
      body: PaddingUtility.only(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
          children: [
            CategoryFieldGenerator(
              categories: categories,
              categoriesState: categoriesState,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: StoreFieldGenerator(
                isGrid: true,
                storeFieldList: [
                  {
                    // 'asset': Assets.media.images.img.path,
                    'title': 'Name shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Name Shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Title',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Name shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Name Shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Title',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Name shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Name Shop',
                    'description': 'Description'
                  },
                  {
                    'asset': Assets.media.images.img.path,
                    'title': 'Title',
                    'description': 'Description'
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
