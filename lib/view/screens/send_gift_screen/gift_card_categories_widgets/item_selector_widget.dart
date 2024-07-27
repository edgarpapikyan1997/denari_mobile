import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/brand_item_select_state/brand_item_select_state.dart';
import '../../../widgets/brand_item/brand_item_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../../../widgets/preview_banner/preview_banner.dart';

class ItemSelectorWidget extends StatefulWidget {
  final bool isToken;
  final int? items;
  final BrandItemSelectState brandItemSelectState;
  final String previewTitle;
  final Widget? tealButton;

  const ItemSelectorWidget({
    super.key,
    this.items,
    required this.brandItemSelectState,
    required this.isToken,
    required this.previewTitle,
    this.tealButton,
  });

  @override
  State<ItemSelectorWidget> createState() => _ItemSelectorWidgetState();
}

class _ItemSelectorWidgetState extends State<ItemSelectorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.items != null
              ? PreviewBanner(
                  leadingBanner: Text(
                    widget.previewTitle,
                    style: context.theme.headline2.bold,
                  ),
                  tealButton: widget.tealButton,
                )
              : const SizedBox(),
          const SizedBox(
            height: 24,
          ),
          widget.items != null
              ? Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(
                        9,
                        (index) => BrandItemWidget(
                          // isToken: true,
                          topPadding: 16,
                          avatar: Assets.media.images.toyStory.path,
                          brandName: 'McDonalds',
                          secondaryInfo: widget.isToken
                              ?
                          Row(
                                  children: [
                                    SizedBox(
                                      height: 14,
                                      width: 13,
                                      child: Assets.media.icons.token.svg(),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "50 LD",
                                      style: context.theme.body3.lightGreyText,
                                    ),
                                  ],
                                )
                              : Text(
                                  "50 LD",
                                  style: context.theme.body3.lightGreyText,
                                ),
                          tealButton: SizedBox(
                            height: 24,
                            width: 24,
                            child: Radio(
                                value: index,
                                groupValue: widget.brandItemSelectState.index,
                                onChanged: (index) {
                                  widget.brandItemSelectState
                                      .selectItem(index!);
                                  widget.brandItemSelectState.setItemWidget(
                                    BrandItemWidget(
                                      // isToken: false,
                                        avatar:
                                            Assets.media.images.toyStory.path,
                                        brandName: 'McDonalds',
                                        tokenBalance: 50),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NoDataWidget(
                          asset: widget.isToken
                              ? Assets.media.images.cryptoCurrencyNamecoin
                                  .image(
                                  height: 96,
                                  width: 96,
                                )
                              : Assets.media.images.creditCard1.image(
                                  height: 96,
                                  width: 96,
                                ),
                          title: widget.isToken
                              ? "giftCard.noTokens".tr()
                              : "giftCard.noGiftCards".tr(),
                          description: widget.isToken
                              ? "giftCard.mustMakePurchase".tr()
                              : "giftCard.chooseGiftCards".tr()),
                      const SizedBox(),
                    ],
                  ),
                ),
        ],
      );
    });
  }
}
