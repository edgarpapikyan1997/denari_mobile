import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/main_screen_field.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/product_advertisement_widget.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../utils/themes/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/category/category_field_generator.dart';
import '../widgets/preview_banner/preview_banner.dart';
import '../widgets/sotre_fields/store_field_generator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget mainScreenFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainScreenField(
            asset: Assets.media.icons.creditCard1.svg(),
            title: 'main.myGiftCards'.tr()),
        MainScreenField(
            asset: Assets.media.icons.drawerSend.svg(),
            title: 'main.sendGift'.tr()),
        MainScreenField(
            asset: Assets.media.icons.qrCode.svg(),
            title: 'main.myQRCode'.tr()),
        MainScreenField(
            asset: Assets.media.icons.creditCardSync.svg(),
            title: 'main.transactionHistory'.tr()),
      ],
    ).paddingOnly(bottom: 16, left: 16, right: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 104),
        child: CustomAppBar(
          leadingIcon: Assets.media.icons.token.svg(),
          tokenCount: '400', // should be changed to data from backEnd
          tealIcon: Assets.media.icons.search.svg(),
        ),
      ),
      body: Container(
        width: context.width,
        color: AppColors.white,
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
                    style: context.theme.headline5,
                  ),
                  textButton: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'main.seeAll'.tr(),
                      style: context.theme.headline4.regular.yellowDark,
                    ),
                  ),
                ).paddingOnly(bottom: 16),
                CategoryFieldGenerator(
                  categories: [
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
                    // Add more categories as needed
                  ],
                ).paddingOnly(bottom: 24),
                PreviewBanner(
                  leadingBanner: Text(
                    'main.popularStores'.tr(),
                    style: context.theme.headline3.semiBold,
                  ),
                  textButton: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
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
                      'title' : 'Title',
                      'description' : 'Description'
                    },
                    {
                      'asset': Assets.media.images.coffe.image(),
                      'title' : 'Title',
                      'description' : 'Description'
                    },
                    {
                      'asset': Assets.media.images.coffe.image(),
                      'title' : 'Title',
                      'description' : 'Description'
                    },
                  ],
                ),
              ],
            ).paddingOnly(left: 16, right: 16),
          ],
        ),
      ),
    );
  }
}
