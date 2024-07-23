import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/main_screen_field.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/product_advertisement_widget.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/preview_banner/preview_banner.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/store_fields/store_field_generator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _token = TokenBalanceState();
  final categories = [
    {
      'categoryName': 'main.food'.tr(),
      'categoryIcon': Assets.media.icons.food.svg()
    },
    {
      'categoryName': 'main.beauty'.tr(),
      'categoryIcon': Assets.media.icons.beauty.svg()
    },
    {
      'categoryName': 'main.clothing'.tr(),
      'categoryIcon': Assets.media.icons.clothing.svg()
    },
    {
      'categoryName': 'main.activities'.tr(),
      'categoryIcon': Assets.media.icons.activities.svg()
    },
    {
      'categoryName': 'main.groceries'.tr(),
      'categoryIcon': Assets.media.icons.groceries.svg()
    },
    {
      'categoryName': 'main.travel'.tr(),
      'categoryIcon': Assets.media.icons.travel.svg()
    },
    {
      'categoryName': 'main.other'.tr(),
      'categoryIcon': Assets.media.icons.other.svg()
    },
  ];
  CategoriesState? categoriesState;

  @override
  void initState() {
    super.initState();
    // _token.getTokenBalance();
    initCategories();
  }

  initCategories() {
    categoriesState = CategoriesState(
      initialCategory: categories[0]['categoryName'].toString(),
    );
  }

  Widget mainScreenFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainScreenField(
          asset: Assets.media.icons.creditCard1.svg(),
          title: 'main.myGiftCards'.tr(),
          navigationTitle: '/myGiftCards',
        ),
        MainScreenField(
          asset: Assets.media.icons.drawerSend.svg(),
          title: 'main.sendGift'.tr(),
          navigationTitle: '/sendGift',
        ),
        MainScreenField(
          asset: Assets.media.icons.qrCode.svg(),
          title: 'main.myQRCode'.tr(),
          navigationTitle: '/myQRCode',
          token: _token.earnedToken.toString(),
        ),
        MainScreenField(
          asset: Assets.media.icons.creditCardSync.svg(),
          title: 'main.transactionHistory'.tr(),
          navigationTitle: '/transactionHistory',
        ),
      ],
    ).paddingOnly(bottom: 16, left: 16, right: 16);
  }
  @override
  Widget build(BuildContext context) {
    // Define the categories list

    return Observer(builder: (context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 104),
          child: CustomAppBar(
            appBarColor: AppColors.yellowLight,
            leadingIcon: Assets.media.icons.token.svg(),
            tokenCount: _token.earnedToken.toString(),
            // should be changed to data from backEnd
            tealIcon: Assets.media.icons.search.svg(),
          ),
        ),
        body: Container(
          width: context.width,
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration:
                        BoxDecoration(color: AppColors.yellowLight, boxShadow: [
                      BoxShadow(
                        color: AppColors.greyDark.withOpacity(0.6),
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                      ),
                    ]),
                    child: mainScreenFields()),
                Column(
                  children: [
                    ProductAdvertisementWidget(
                      image: Assets.media.images.coffe.provider(),
                      radius: 10,
                    ).paddingOnly(
                      top: 24,
                      bottom: 32,
                    ),
                    PreviewBanner(
                      leadingBanner: Text(
                        'main.topCategories'.tr(),
                        style: context.theme.headline5.bold,
                      ),
                      tealButton: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'main.seeAll'.tr(),
                          style: context.theme.headline4.regular.yellowDark,
                        ),
                      ),
                    ).paddingOnly(bottom: 16),
                    CategoryFieldGenerator(
                      categoriesState: categoriesState!,
                      categories: categories,
                    ).paddingOnly(bottom: 24),
                    PreviewBanner(
                      leadingBanner: Text(
                        'main.popularStores'.tr(),
                        style: context.theme.headline3.semiBold,
                      ),
                      tealButton: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'main.seeAll'.tr(),
                          style: context.theme.headline4.regular.yellowDark,
                        ),
                      ),
                    ).paddingOnly(bottom: 16),
                    StoreFieldGenerator(
                      storeFieldList: [
                        {
                          'asset': Assets.media.images.coffe.image(),
                          'title': 'Name shop',
                          'description': 'Description'
                        },
                        {
                          'asset': Assets.media.images.coffe.image(),
                          'title': 'Name Shop',
                          'description': 'Description'
                        },
                        {
                          'asset': Assets.media.images.coffe.image(),
                          'title': 'Title',
                          'description': 'Description'
                        },
                      ],
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16),
              ],
            ),
          ),
        ),
      );
    });
  }
}
