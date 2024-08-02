import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/main_screen_field.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/product_advertisement_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../data/token/repository/impl/token_repository_impl.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/qr_id.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/category/category.dart';
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
  final LoadingState _loadingState = LoadingState();
  final TokenBalanceState _state =
      TokenBalanceState(tokenRepository: di.get<ImplTokenRepository>());
  final CategoriesState categoriesState = CategoriesState();
  final qrIdReceiver = GetIt.instance<QRIdReceiver>();
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
    _state.getTokenBalance();
    _loadingState.stopLoading();
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
    return Observer(builder: (context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppSizes.prefSizes,
          child: CustomAppBar(
            appBarColor: AppColors.yellowLight,
            leadingIcon: Assets.media.icons.token.svg(),
            tokenBalance: _state.tokenBalance?.totalBalance ?? _state.balance,
            // should be changed to data from backEnd
            tealIcon: Assets.media.icons.search.svg(),
          ),
        ),
        body: Column(
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
            Expanded(
              child: PaddingUtility.only(
                left: 16,
                right: 16,
                child: SingleChildScrollView(
                  child: Column(
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
                            padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.zero),
                            minimumSize:
                                WidgetStateProperty.all<Size>(Size.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'main.seeAll'.tr(),
                            style: context.theme.headline4.regular.yellowDark,
                          ),
                        ),
                      ).paddingOnly(bottom: 16),
                      CategoryFieldGenerator(
                        categoriesState: categoriesState,
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
                            padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.zero),
                            minimumSize:
                                WidgetStateProperty.all<Size>(Size.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'main.seeAll'.tr(),
                            style: context.theme.headline4.regular.yellowDark,
                          ),
                        ),
                      ).paddingOnly(bottom: 16),
                      StoreFieldGenerator(
                        isGrid: false,
                        storeFieldList: [
                          {
                            'asset': Assets.media.images.img.path,
                            'title': 'Name shop',
                            'description': 'Description'
                          },
                          {
                            'asset': Assets.media.images.coffe.path,
                            'title': 'Name Shop',
                            'description': 'Description'
                          },
                          {
                            'asset': Assets.media.images.coffe.path,
                            'title': 'Title',
                            'description': 'Description'
                          },
                          {
                            'asset': Assets.media.images.img.path,
                            'title': 'Name shop',
                            'description': 'Description'
                          },
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
