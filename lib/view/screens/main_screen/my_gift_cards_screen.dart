import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/token_balance_state/token_balance_state.dart';
import '../../widgets/bottom_sheet/Item_info_bottom_sheet.dart';
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
  final _tokenBalanceState = TokenBalanceState();
  final brandName = 'Disney Toy Store';
  final purchaseDate = 'July 24, 2024';
  // final List<BrandItemWidget> brandItems = [];

  @override
  Widget build(BuildContext context) {
    final brandItems = [
      for (var i = 0; i < 10; ++i)
        BrandItemWidget(
          avatar: Assets.media.images.toyStory.path,
          brandName: '$brandName$i',
          tokenBalance: _tokenBalanceState.giftCardLD.toString(),
          tealButton: GestureDetector(
            onTap: () {
              showItemInfoBottomSheet(
                /// must be changed to data from backend
              context: context,
                onConfirm: () {
                  context.pop();
                },
                addButtons: true,
                addCloseButton: true,
                image: Assets.media.images.image9.path,
                itemTitle: brandName,
                itemTitleChevronRight: true,
                underInfoCostText: Text(
                  'Purchase date: $purchaseDate',
                  style: context.theme.caption.lightGreyText,
                ),
                itemInfoCost: _tokenBalanceState.giftCardLD.toString(),
              );
            },
            child: Assets.media.icons.chevronRight.svg(),
          ),
        ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 88),
        child: CustomAppBar(
          leadingIcon: GestureDetector(
            onTap: () {
              context.pop();
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
                    leadingBanner: Text(
                      'giftCard.giftCards'.tr(),
                      style: context.theme.headline2.bold,
                    ),
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
