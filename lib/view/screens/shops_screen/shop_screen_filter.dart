import 'package:denari_app/store/categories_state/categories_state.dart';
import 'package:denari_app/store/filters/switcher_state/switcher_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/category/category_field_generator.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/category/category.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/filter_widgets/distance_configurator/distance_configurator.dart';
import '../../widgets/filter_widgets/distance_configurator/switcher_widget.dart';

class ShopScreenFilter extends StatefulWidget {
  const ShopScreenFilter({
    super.key,
  });

  @override
  State<ShopScreenFilter> createState() => _ShopScreenFilterState();
}

class _ShopScreenFilterState extends State<ShopScreenFilter> {
  final LoadingState _loadingState = LoadingState();
  final SwitcherState _switcherState = SwitcherState();
  final CategoriesState categoriesState = CategoriesState();
  late final List<Category> categories;
  late final List<Category> locationCategories;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initCategories() {
    categoriesState.selectCategory(
        categoryName: categories[0].name, newCategoryType: categories[0].type);
  }

  void initPrefs() {
    _loadingState.startLoading();
    categories = [
      Category(
          type: CategoryType.allNoIcon, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.city, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.town, iconColor: categoriesState.itemColor),
    ];
    locationCategories = [
      Category(
          type: CategoryType.italian, iconColor: categoriesState.itemColor),
      Category(type: CategoryType.desert, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.armenian, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.georgian, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.belarusian, iconColor: categoriesState.itemColor),
    ];
    initCategories();
    _loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          title: Text(
            "shops.filters".tr(),
            style: context.theme.body1.semiBold.black,
          ),
          leadingIcon: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Assets.media.icons.chevronLeft.svg()),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: PaddingUtility.only(
          top: 8,
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreviewBanner(
                leadingBanner: 'shops.location'.tr(),
                bannerUnderText: 'shops.selectLocation'.tr(),
              ),
              const Delimiter(16),
              CategoryFieldGenerator(
                justSelector: true,
                categories: categories,
                categoriesState: categoriesState,
                unselectedColor: AppColors.whiteGrey,
                borderColor: AppColors.whiteGrey,
              ),
              const Delimiter(32),
              PreviewBanner(
                leadingBanner: 'shops.distanceToStore'.tr(),
                bannerUnderText: 'shops.enterMinMaxDistance'.tr(),
              ),
              const Delimiter(16),
              const DistanceConfigurator(),
              const Delimiter(32),
              PreviewBanner(
                leadingBanner: 'shops.workingNow'.tr(),
                tealButton: SwitcherWidget(
                  switcherState: _switcherState,
                  onTap: () {
                    print(_switcherState.switchEnable);
                  },
                ),
              ),
              const Delimiter(32),
              PreviewBanner(
                leadingBanner: 'shops.category'.tr(),
              ),
              const Delimiter(16),
              CategoryFieldGenerator(
                  isRow: false,
                  justSelector: true,
                  unselectedColor: AppColors.borderColor,
                  categories: locationCategories,
                  categoriesState: categoriesState),
              const Delimiter(80),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          isEnabled: true,
                          isWhite: true,
                          title: 'shops.reset'.tr(),
                          onTap: () {})),
                  const Delimiter(8),
                  Expanded(
                      child: CustomButton(
                          isEnabled: true,
                          isWhite: false,
                          title: 'profile.apply'.tr(),
                          onTap: () {}))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
