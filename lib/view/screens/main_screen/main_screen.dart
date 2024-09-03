import 'dart:async';
import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/data/advertisements/repository/advertisements_repository.dart';
import 'package:denari_app/store/categories_state/categories_state.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/main_screen_widgets/main_screen_field.dart';
import 'package:denari_app/view/screens/main_screen/widgets/advertisements_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../data/authentication/repository/auth_repository.dart';
import '../../../data/profile/repository/profile_repository.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../data/token/repository/impl/token_repository_impl.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/qr_id.dart';
import '../../../store/profile/profile_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/category/category.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/preview_banner/preview_banner.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/scaffold_nav_bar.dart';
import '../store_field_screen/widgets/store_field_generator.dart';
import 'bloc/advertisements_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ShopsState _shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  final ProfileState _profileState = ProfileState(
    authRepository: di.get<AuthRepository>(),
    profileRepository: di.get<ProfileRepository>(),
  );

  final LoadingState _loadingState = LoadingState();
  final TokenBalanceState _tokenBalanceState =
      TokenBalanceState(tokenRepository: di.get<ImplTokenRepository>());
  final CategoriesState categoriesState = CategoriesState();
  final qrIdReceiver = GetIt.instance<QRIdReceiver>();
  late final List<Category> categories;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initCategories() {
    categoriesState.selectCategory(
        categoryName: categories[0].name, newCategoryType: categories[0].type);
  }

  void initPrefs() async{
    try {
      _loadingState.startLoading();
      categories = [
        Category(type: CategoryType.food, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.beauty, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.clothing, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.activities, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.groceries, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.travel, iconColor: categoriesState.itemColor),
        Category(type: CategoryType.other, iconColor: categoriesState.itemColor),
      ];
      initCategories();
      _profileState.getProfile();
      _tokenBalanceState.getTokenBalance();
      await _tryFetchingDataWithTimeout();
      _loadingState.stopLoading();
    } catch (e) {
      _loadingState.stopLoading();
      setState(() {
        hasError = true;
      });
    }
  }


  Future<void> _tryFetchingDataWithTimeout() async {
    try {
      await Future.any([
        _shopsState.getAllShops(),
        Future.delayed(const Duration(seconds: 3)).then((_) {
          throw TimeoutException('Data fetching timed out');
        }),
      ]);
    } catch (e) {
      if (e is TimeoutException) {
        await _retryFetchingData();
      } else {
        rethrow;
      }
    }
  }
  Widget buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Failed to load data. Please try again later.'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Retry logic
              setState(() {
                hasError = false;
                initPrefs();
              });
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _retryFetchingData() async {
    try {
      // Retry fetching shops data
      await _shopsState.getAllShops();
    } catch (e) {
      throw Exception('Failed after retry');
    }
  }



  Widget mainScreenFields() {
    print("profile id is >>>>${_profileState.profile.id}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainScreenField(
          asset: Assets.media.icons.creditCard1.svg(),
          title: 'main.myGiftCards'.tr(),
          navigationTitle: '/myGiftCardsScreen',
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
          userID: _profileState.profile.id,
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
    return BlocProvider(
      create: (context) =>
          AdvertisementsBloc(repository: di.get<AdvertisementsRepository>())
            ..add(AdvertisementsFetchEvent()),
      child: Observer(builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: AppSizes.prefSizes,
            child: CustomAppBar(
              appBarType: AppBarType.token,
              appBarColor: AppColors.yellowLight,
              leadingIcon: Assets.media.icons.token.svg(),
              tokenBalance: _tokenBalanceState.balance,
              // should be changed to data from backEnd
              tealIcon: GestureDetector(
                onTap: () {
                  context.push('/searchScreen');
                },
                child: Assets.media.icons.search.svg(),
              ),
            ),
          ),
          body: _loadingState.isLoading == true
              ? const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator())
              : Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.yellowLight,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyDark.withOpacity(0.6),
                              blurRadius: 8,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 0,
                            ),
                          ]),
                      child: mainScreenFields(),
                    ),
                    Expanded(
                      child: PaddingUtility.only(
                        left: 16,
                        right: 16,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const AdvertisementsWidget(),
                              const Delimiter(32),
                              PreviewBanner(
                                leadingBanner: 'main.topCategories'.tr(),
                                previewStyle: context.theme.headline5.bold,
                                tealButton: TextButton(
                                  onPressed: () {
                                    categoriesState.selectCategory(
                                      categoryName: categories[0].name,
                                      newCategoryType: categories[0].type,
                                    );
                                    bottomNavBarState.changeIndex(3);
                                    context.push('/shopsScreen');
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        WidgetStateProperty.all<EdgeInsets>(
                                            EdgeInsets.zero),
                                    minimumSize:
                                        WidgetStateProperty.all<Size>(
                                            Size.zero),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'main.seeAll'.tr(),
                                    style: context
                                        .theme.headline4.regular.yellowDark,
                                  ),
                                ),
                              ).paddingOnly(bottom: 16),
                              CategoryFieldGenerator(
                                categoriesState: categoriesState,
                                categories: categories,
                              ).paddingOnly(bottom: 24),
                              PreviewBanner(
                                leadingBanner: 'main.popularStores'.tr(),
                                previewStyle:
                                    context.theme.headline3.semiBold,
                                tealButton: TextButton(
                                  onPressed: () {
                                    categoriesState.selectCategory(
                                        categoryName: categories[0].name,
                                        newCategoryType: categories[0].type);
                                    bottomNavBarState.changeIndex(3);
                                    context.push('/shopsScreen');
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        WidgetStateProperty.all<EdgeInsets>(
                                            EdgeInsets.zero),
                                    minimumSize:
                                        WidgetStateProperty.all<Size>(
                                            Size.zero),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'main.seeAll'.tr(),
                                    style: context
                                        .theme.headline4.regular.yellowDark,
                                  ),
                                ),
                              ).paddingOnly(bottom: 16),
                              StoreFieldGenerator(
                                  isGrid: false,
                                  storeFieldList: _shopsState.shops),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
