import 'package:denari_app/constants/app_bar_type.dart';
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
import 'package:go_router/go_router.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/bottom_sheet/Item_info_bottom_sheet.dart';
import '../../widgets/bottom_sheet/variants/modal_sheet.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/filter_widgets/new_purchase_filter/new_purchase_filter.dart';

class StoreFieldItemScreen extends StatefulWidget {
  const StoreFieldItemScreen({
    super.key,
  });

  @override
  State<StoreFieldItemScreen> createState() => _StoreFieldItemScreenState();
}

class _StoreFieldItemScreenState extends State<StoreFieldItemScreen> {
  bool isEmpty = false;
  String name = 'Store Name';
  String rating = "4.5";
  String phone = '+1 (123) 456-7890';
  String city = '123 Main St, City';
  String dateTime = 'Daily from 10:00 to 20:00';

  /// Must be changed to data from backend

  List<String>? imageList = [
    Assets.media.images.img.path,
    Assets.media.images.img.path,
    Assets.media.images.channel.path,
    Assets.media.images.img.path,
    Assets.media.images.channel.path,
  ];

  @override
  void initState() {
    super.initState();
    isEmpty = imageList == null || imageList!.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StoreItemInfo(
                  items: [
                    StoreItemInfoCreator(
                      svgPicture: Assets.media.icons.phoneCall.svg(),
                      textValue: phone,
                    ),
                    StoreItemInfoCreator(
                      svgPicture: Assets.media.icons.map.svg(),
                      textValue: city,
                    ),
                  ],
                ),
                const Delimiter(12),
                StoreFieldProperty(
                  asset: Assets.media.icons.store.svg(
                      colorFilter: const ColorFilter.mode(
                          AppColors.yellowDark, BlendMode.srcIn)),
                  title: '12 Branches',
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
                          '3%',
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
                          '650 LD',
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
                            balance: 100,
                            textStyle: context.theme.headline5.semiBold,
                          )),
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
                PreviewBanner(leadingBanner: 'shops.giftCardOptions'.tr()),
                const Delimiter(12),
                BrandItemWidget(
                  avatar: Assets.media.icons.card.path,
                  brandName: 'Gift Card 100',
                  addDivider: true,
                  tokenBalance: 100,
                  tealButton: GestureDetector(
                    onTap: () {
                      showItemInfoBottomSheet(
                        /// must be changed to data from backend
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
                              child: const SizedBox(child: NewPurchaseFilter()),
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
  }
}
