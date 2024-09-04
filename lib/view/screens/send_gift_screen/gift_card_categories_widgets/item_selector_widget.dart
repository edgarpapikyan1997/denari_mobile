import 'package:denari_app/data/gift_card_model/gift_card_model.dart';
import 'package:denari_app/data/token/model/token_model.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinput/pinput.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/brand_item_select_state/brand_item_select_state.dart';
import '../../../widgets/brand_item/brand_item_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../../../widgets/preview_banner/preview_banner.dart';
import 'item_selector_item.dart';

class ItemSelectorWidget extends StatefulWidget {
  final bool isToken;
  final List<TokenModel>? tokenItems;
  final List<GiftCardModel>? giftItems;
  final BrandItemSelectState brandItemSelectState;
  final String previewTitle;
  final Widget? tealButton;

  const ItemSelectorWidget({
    super.key,
    required this.brandItemSelectState,
    required this.isToken,
    required this.previewTitle,
    this.tealButton,
    this.tokenItems,
    this.giftItems,
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
          widget.tokenItems != null || widget.giftItems != null
              ? PreviewBanner(
                  leadingBanner: widget.previewTitle,
                  tealButton: widget.tealButton,
                )
              : const SizedBox(),
          const SizedBox(
            height: 24,
          ),
          widget.isToken && widget.tokenItems != null
              ? Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(
                        widget.tokenItems!.length,
                        (index) => BrandItemWidget(
                          topPadding: 16,
                          avatar: widget.tokenItems![index].imageUrl,
                          brandName: widget.tokenItems![index].name,
                          secondaryInfo: Row(
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
                                "${widget.tokenItems![index].shopUserTokens![0].tokenBalance}",
                                style: context.theme.body3.lightGreyText,
                              ),
                            ],
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
              : widget.giftItems != null
                  ? Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: List.generate(
                            widget.giftItems!.length,
                            (index) => BrandItemWidget(
                              topPadding: 16,
                              avatar: "widget.giftItems![index].imageUrl",
                              brandName: widget.giftItems![index].uniqueID,
                              secondaryInfo: Text(
                                "${widget.giftItems![index].value}",
                                style: context.theme.body3.lightGreyText,
                              ),
                              tealButton: SizedBox(
                                height: 24,
                                width: 24,
                                child: Radio(
                                    value: index,
                                    groupValue:
                                        widget.brandItemSelectState.index,
                                    onChanged: (index) {
                                      widget.brandItemSelectState
                                          .selectItem(index!);
                                      widget.brandItemSelectState.setItemWidget(
                                        BrandItemWidget(
                                            avatar: Assets.media.images.toyStory.path,
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
