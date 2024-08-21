import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
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
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/bottom_sheet/Item_info_bottom_sheet.dart';
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
  final ShopsState _shopState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  ShopsUnitModel? storeData;

  final LoadingState _loadingState = LoadingState();
  bool isEmpty = false;
  String name = 'Store Name';
  String rating = "4.5";
  String phone = '+1 (123) 456-7890';
  String city = '123 Main St, City';
  String dateTime = 'Daily from 10:00 to 20:00';
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    _loadingState.startLoading();
    await _shopState.getShopByID(id: widget.uniqueID);
    storeData = _shopState.shopsUnitModel;
    print(_shopState.shopsUnitModel?.imageUrl);
    if (_shopState.shopsUnitModel?.imageUrl != null) {
      imageList.add(_shopState.shopsUnitModel!.imageUrl);
    }
    isEmpty = imageList.isEmpty;
    _loadingState.stopLoading();
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StoreItemInfo(
                          storeName: storeData!.name,
                          storeImage: storeData!.imageUrl,
                          items: [
                            StoreItemInfoCreator(
                              svgPicture: Assets.media.icons.phoneCall.svg(),
                              textValue: storeData!.branch[0].phone,
                            ),
                            StoreItemInfoCreator(
                              svgPicture: Assets.media.icons.map.svg(),
                              textValue:
                                  "${storeData!.branch[0].street}, ${storeData!.branch[0].city}",
                            ),
                          ],
                        ),
                        const Delimiter(12),
                        StoreFieldProperty(
                          asset: Assets.media.icons.store.svg(
                              colorFilter: const ColorFilter.mode(
                                  AppColors.yellowDark, BlendMode.srcIn)),
                          title: '${storeData?.branch.length} Branches',
                          onTap: () {
                            context.push('/mapScreen');
                          },
                        ),
                        const Delimiter(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: StoreFieldProperty(
                                isRow: false,
                                title: "shops.cashbackRate".tr(),
                                secondaryValue: Text(
                                  '${_shopState.shopsUnitModel?.cashback ?? 0}%',
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
                                  '${_shopState.shopsUnitModel?.shopUserTokens[0].giftCardBalance ?? 0} LD',
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
                                  balance: _shopState.shopsUnitModel
                                          ?.shopUserTokens[0].tokenBalance ??
                                      0,
                                  textStyle: context.theme.headline5.semiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Delimiter(16),
                        StoreFieldProperty(
                          asset: Assets.media.icons.handShake.svg(
                              colorFilter: const ColorFilter.mode(
                                  AppColors.yellowDark, BlendMode.srcIn)),
                          title: 'Allianse (4)',
                          onTap: () {
                            context.push('/alliance', extra: true);
                          },
                        ),
                        const Delimiter(32),
                        PreviewBanner(
                            leadingBanner: 'shops.giftCardOptions'.tr()),
                        const Delimiter(12),
                        BrandItemWidget(
                          avatar: Assets.media.icons.card.path,
                          brandName: 'Gift Card 100',
                          addDivider: true,
                          tokenBalance: 100,
                          tealButton: GestureDetector(
                            onTap: () {
                              showItemInfoBottomSheet(
                                secondButtonTitle: 'Buy',
                                firstButtonTitle: 'Close',
                                context: context,
                                onConfirmSecond: () {
                                  context.pop();
                                },
                                onConfirmFirst: () {},
                                addButtons: true,
                                addCloseButton: true,
                                image: Assets.media.images.image9.path,
                                itemTitle: 'Disney Toy store',
                                itemTitleChevronRight: true,
                                underInfoCostText: Text(
                                  'Gift Card 100',
                                  style: context.theme.body1,
                                ),
                                itemInfoCost: '100',
                              );
                            },
                            child: Assets.media.icons.chevronRight.svg(),
                          ),
                          iconAvatar: Assets.media.icons.card.svg(
                            colorFilter: const ColorFilter.mode(
                                AppColors.yellowDark, BlendMode.srcIn),
                          ),
                        ),
                        const Delimiter(16),
                        BrandItemWidget(
                          avatar: Assets.media.icons.card.path,
                          brandName: 'Gift Card 100',
                          addDivider: true,
                          tokenBalance: 100,
                          tealButton: GestureDetector(
                            onTap: () {},
                            child: Assets.media.icons.chevronRight.svg(),
                          ),
                          iconAvatar: Assets.media.icons.card.svg(
                            colorFilter: const ColorFilter.mode(
                                AppColors.yellowDark, BlendMode.srcIn),
                          ),
                        ),
                        const Delimiter(8),
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
                                    showModalSheet(
                                      context: context,
                                      child: const SizedBox(
                                          child: NewPurchaseFilter()),
                                    );
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
