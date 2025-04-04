import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/token_balance_state/token_balance_state.dart';
import '../../widgets/bottom_sheet/item_info_bottom_sheet.dart';
import '../../widgets/brand_item/brand_item_list.dart';
import '../../widgets/brand_item/brand_item_widget.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/no_data_widget.dart';
import '../../widgets/preview_banner/preview_banner.dart';

class MyGiftCardsScreen extends StatefulWidget {
  const MyGiftCardsScreen({super.key});

  @override
  State<MyGiftCardsScreen> createState() => _MyGiftCardsScreenState();
}

class _MyGiftCardsScreenState extends State<MyGiftCardsScreen> {
  final _tokenBalanceState = TokenBalanceState(tokenRepository: null);
  final brandName = 'Disney Toy Store';
  final purchaseDate = 'July 24, 2024';



  @override
  Widget build(BuildContext context) {
    final brandItems = [
      for (var i = 0; i < 10; ++i)
        BrandItemWidget(
          topPadding: 16,
          addDivider: true,
          avatar: Assets.media.images.skyteam.path,
          brandName: '$brandName$i',
          balanceLD: _tokenBalanceState.balance,
          iconHeight: 13,
          iconWidth: 14,
          addPlus: false,
          addPreviewBanner: false,
          tealButton: GestureDetector(
            onTap: () {
              showItemInfoBottomSheet(
                /// must be changed to data from backend
                firstButtonTitle: 'Send',
                secondButtonTitle: 'Use',
                onConfirmFirst: () {},
                context: context,
                onConfirmSecond: () {
                  context.pop();
                },
                addButtons: true,
                addCloseButton: true,
                image: Assets.media.images.frame.path,
                itemTitle: brandName,
                itemTitleChevronRight: true,
                underInfoCostText: Text(
                  'Purchase date: $purchaseDate',
                  style: context.theme.caption.lightGreyText,
                ),
                itemInfoCost: _tokenBalanceState.balance.toString(),
              );
            },
            child: Assets.media.icons.chevronRight.svg(),
          ),
        ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          appBarType: AppBarType.regular,
          leadingIcon: GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: Assets.media.icons.chevronLeft.svg(),
          ),
          title: Text(
            "giftCard.myGiftCards".tr(),
            style: context.theme.headline4,
          ),
          tealIcon: GestureDetector(
            onTap: () {
              context.go('/searchScreen');
            },
            child: Assets.media.icons.search.svg(),
          ),
        ),
      ),
      body: brandItems.isNotEmpty
          ? Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  PreviewBanner(
                    leadingBanner: 'giftCard.giftCards'.tr(),
                    bannerUnderText: 'giftCard.manageGifts'.tr(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: BrandItemList(
                      brandItems: brandItems,
                      itemsToLoad: 9,
                    ),
                  ),
                ],
              ),
            )
          : NoDataWidget(
              asset: Assets.media.images.creditCard1.image(
                height: 96,
                width: 96,
              ),
              title: "giftCard.noGiftCards".tr(),
              description: "giftCard.chooseGiftCardInApp".tr(),
            ),
    );
  }
}
