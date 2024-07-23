import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../store/brand_item_select_state/brand_item_select_state.dart';
import '../../../widgets/brand_item/brand_item_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../../../widgets/preview_banner/preview_banner.dart';

class TotalBalanceTokens extends StatelessWidget {
  final int? items;
  final BrandItemSelectState brandItemSelectState;

  const TotalBalanceTokens(
      {super.key, this.items, required this.brandItemSelectState});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreviewBanner(
              leadingBanner: Text(
                'giftCard.selectGift'.tr(),
                style: context.theme.headline2.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            items != null
                ? Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          for (var i = 0; i < items!; ++i)
                            BrandItemWidget(
                              avatar: Assets.media.images.toyStory.path,
                              brandName: 'McDonalds',
                              secondaryInfo: Text(
                                '50 LD',
                                style: context.theme.body3.lightGreyText,
                              ),
                              tealButton: SizedBox(
                                height: 24,
                                width: 24,
                                child: GestureDetector(
                                  onTap: () {
                                    brandItemSelectState.selectItem(i);
                                  },
                                  child: Radio(
                                      value: i,
                                      groupValue: brandItemSelectState.index,
                                      onChanged: (index) {
                                        brandItemSelectState.selectItem(index!);
                                      }),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NoDataWidget(
                            asset: Assets.media.images.creditCard1.image(
                              height: 96,
                              width: 96,
                            ),
                            title: "giftCard.noGiftCards".tr(),
                            description: "giftCard.chooseGiftCards".tr()),
                        const SizedBox(),
                      ],
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
