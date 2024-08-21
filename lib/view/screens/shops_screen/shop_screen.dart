import 'package:denari_app/store/shops/shops_state/shops_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/category/category_field_generator.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../utils/di/config.dart';
import '../../widgets/category/category.dart';
import '../../widgets/custom_app_bar.dart';
import '../store_field_screen/widgets/store_field_generator.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({super.key});

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  final ShopsState _state = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  final LoadingState _loadingState = LoadingState();
  final CategoriesState categoriesState = CategoriesState();
  late final List<Category> categories;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initCategories() {
    categoriesState.selectCategory(
        categoryName: categories[0].name, newCategoryType: categories[0].type);
  }

  void initPrefs() async {
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
    await _state.getAllShops();
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          title: Text(
            'shops.shops'.tr(),
            style: context.theme.body1.semiBold.black,
          ),
          tealIcon: Assets.media.icons.search.svg(),
        ),
      ),
      body: PaddingUtility.only(
        left: 16,
        right: 16,
        child: Observer(builder: (_) {
          return Stack(
            children: [
              Column(
                children: [
                  CategoryFieldGenerator(
                    categories: categories,
                    categoriesState: categoriesState,
                  ),
                  const SizedBox(height: 24),
                  _loadingState.isLoading == true
                      ? const Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator()),
                        )
                      : Expanded(
                          child: StoreFieldGenerator(
                            isGrid: true,
                            storeFieldList: _state.shops,
                          ),
                        ),
                ],
              ),
              Positioned(
                bottom: 16,
                child: SizedBox(
                  width: context.width - 32,
                  child: CustomButton(
                      isEnabled: true,
                      isWhite: false,
                      title: 'shops.allShops'.tr(),
                      onTap: () {}),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
