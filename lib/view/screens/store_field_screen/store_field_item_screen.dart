import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:denari_app/store/transactions/transactions_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/screens/store_field_screen/widgets/store_field_property.dart';
import 'package:denari_app/view/screens/store_field_screen/widgets/store_item_info.dart';
import 'package:denari_app/view/screens/store_field_screen/widgets/store_item_info_creater.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../data/authentication/repository/auth_repository.dart';
import '../../../data/profile/repository/profile_repository.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../data/transactions/model/transaction_model.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/filters/slider_state/slider_state.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/profile/profile_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/bottom_sheet/item_info_bottom_sheet.dart';
import '../../widgets/bottom_sheet/variants/modal_sheet.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/filter_widgets/new_purchase_filter/new_purchase_filter.dart';

class StoreFieldItemScreen extends StatefulWidget {
  final String uniqueID;

  const StoreFieldItemScreen({
    super.key,
    required this.uniqueID,
  });

  @override
  State<StoreFieldItemScreen> createState() => _StoreFieldItemScreenState();
}

class _StoreFieldItemScreenState extends State<StoreFieldItemScreen> {
  SliderState giftSliderState = SliderState();
  SliderState tokenSliderState = SliderState();
  final ProfileState _profileState = ProfileState(
    authRepository: di.get<AuthRepository>(),
    profileRepository: di.get<ProfileRepository>(),
  );
  final ShopsState _shopState =
  ShopsState(shopsRepository: di.get<ImplShopsRepository>());
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  ShopsUnitModel? storeData;
  final LoadingState _loadingState = LoadingState();
  bool isEmpty = false;
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    _loadingState.startLoading();
    await _profileState.getProfile();
    await _shopState.getShopByID(id: widget.uniqueID);
    storeData = _shopState.shopsUnitModel;
    if (_shopState.shopsUnitModel?.imageUrl != null) {
      imageList.add(_shopState.shopsUnitModel!.imageUrl);
    }
    isEmpty = imageList.isEmpty;
    _loadingState.stopLoading();
  }

  List<Widget> getGiftCardOptions() {
    return List.generate(_shopState.shopsUnitModel!.giftCards.length, (index) {
      return PaddingUtility.only(
        bottom: 16,
        child: BrandItemWidget(
          avatar: Assets.media.icons.card.path,
          brandName:
          'Gift Card ${_shopState.shopsUnitModel?.giftCards[index].value}',
          addDivider: true,
          tokenBalance: _shopState.shopsUnitModel?.giftCards[index].value ?? 0,
          tealButton: GestureDetector(
            onTap: () {
              showItemInfoBottomSheet(
                secondButtonTitle: 'Buy',
                firstButtonTitle: 'Close',
                context: context,
                onConfirmSecond: () async {
                  final success = await _transactionsState.sendTransaction(
                    TransactionModel(
                      giftCardAmount:
                      _shopState.shopsUnitModel!.giftCards[index].value,
                      amountGiftCardsUsing:
                      _shopState.shopsUnitModel?.giftCards[index].value,
                      tokenAddedAmount: 0,
                      amountTokensUsed: 0,
                      transactionsAmount:
                      _shopState.shopsUnitModel?.giftCards[index].value,
                      shopId: widget.uniqueID,
                      status: 'status.onHold',
                      date: DateTime.now().toString(),
                      addressShopId: 12,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: success
                          ? Text('transaction.transactionSent'.tr())
                          : Text('transaction.transactionError'.tr()),
                    ),
                  );
                  context.pop();
                },
                onConfirmFirst: () {
                  context.pop();
                },
                addButtons: true,
                addCloseButton: true,
                image: _shopState.shopsUnitModel!.imageUrl,
                itemTitle: _shopState.shopsUnitModel!.name,
                itemTitleChevronRight: true,
                underInfoCostText: Text(
                  'Gift Card ${_shopState.shopsUnitModel?.giftCards[index]
                      .value}',
                  style: context.theme.body1,
                ),
                itemInfoCost:
                '${_shopState.shopsUnitModel?.giftCards[index].value}',
              );
            },
            child: Assets.media.icons.chevronRight.svg(),
          ),
          iconAvatar: Assets.media.icons.card.svg(
            colorFilter:
            const ColorFilter.mode(AppColors.yellowDark, BlendMode.srcIn),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        color: AppColors.white,
        child: _loadingState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
          appBar: PreferredSize(
            preferredSize: AppSizes.backGroundImagePrefSize,
            child: CustomAppBar(
              appBarType: isEmpty ? AppBarType.regular : AppBarType.image,
              imageList: imageList,
              leadingIcon: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Assets.media.icons.chevronLeft.svg(
                    colorFilter: ColorFilter.mode(
                        isEmpty ? AppColors.black : AppColors.white,
                        BlendMode.srcIn),
                  )),
            ),
          ),
          body: PaddingUtility(
            all: 16,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StoreItemInfo(
                          storeName: storeData!.name,
                          storeImage: storeData!.imageUrl,
                          items: [
                            StoreItemInfoCreator(
                              svgPicture:
                              Assets.media.icons.phoneCall.svg(),
                              textValue: storeData!.branch[0].phone,
                            ),
                            StoreItemInfoCreator(
                              svgPicture: Assets.media.icons.map.svg(),
                              textValue:
                              "${storeData!.branch[0].street}, ${storeData!
                                  .branch[0].city}",
                            ),
                          ],
                        ),
                        const Delimiter(12),
                        StoreFieldProperty(
                          asset: Assets.media.icons.store.svg(
                              colorFilter: const ColorFilter.mode(
                                  AppColors.yellowDark, BlendMode.srcIn)),
                          title: '${storeData!.branch.length} Branches',
                          onTap: () {
                            context.push('/mapScreen', extra: storeData);
                          },
                        ),
                        const Delimiter(16),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: StoreFieldProperty(
                                isRow: false,
                                title: "shops.cashbackRate".tr(),
                                secondaryValue: Text(
                                  '${_shopState.shopsUnitModel?.cashback ??
                                      0}%',
                                  style: context.theme.headline5.semiBold,
                                ),
                              ),
                            ),
                            const Delimiter(8),
                            Expanded(
                              child: StoreFieldProperty(
                                isRow: false,
                                title: "shops.currentBalance".tr(),
                                secondaryValue: Text(
                                  '${_shopState.shopsUnitModel
                                      ?.shopUserTokens[0].giftCardBalance ??
                                      0} LD',
                                  style: context.theme.headline5.semiBold,
                                ),
                              ),
                            ),
                            const Delimiter(8),
                            Expanded(
                              child: StoreFieldProperty(
                                isRow: false,
                                title: "shops.tokenBalance".tr(),
                                secondaryValue: BalanceWidget(
                                  isTokenBalance: true,
                                  balance: _shopState
                                      .shopsUnitModel
                                      ?.shopUserTokens[0]
                                      .tokenBalance ??
                                      0,
                                  textStyle:
                                  context.theme.headline5.semiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Delimiter(16),
                        // StoreFieldProperty(
                        //   asset: Assets.media.icons.handShake.svg(
                        //       colorFilter: const ColorFilter.mode(
                        //           AppColors.yellowDark, BlendMode.srcIn)),
                        //   title: 'Allianse (4)',
                        //   onTap: () {
                        //     context.push('/alliance', extra: true);
                        //   },
                        // ),
                        // const Delimiter(32),
                        PreviewBanner(
                            leadingBanner: 'shops.giftCardOptions'.tr()),
                        const Delimiter(12),
                        Column(
                          children: getGiftCardOptions(),
                        ),
                        const Delimiter(8),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          isEnabled: true,
                          isWhite: true,
                          title: 'shops.redemeToken'.tr(),
                          onTap: () {}),
                    ),
                    const Delimiter(8),
                    Expanded(
                      child: CustomButton(
                          isEnabled: true,
                          isWhite: false,
                          title: 'shops.newPurchase'.tr(),
                          onTap: () {
                            _shopState.shopsUnitModel != null
                                ? showModalSheet(
                              context: context,
                              child: SizedBox(
                                child: NewPurchaseFilter(
                                  shopUnitModel:
                                  _shopState.shopsUnitModel!,
                                  profileModel:
                                  _profileState.profile,
                                ),
                              ),
                            ) : null;
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
