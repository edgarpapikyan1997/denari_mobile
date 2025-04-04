import 'package:denari_app/store/filters/slider_state/slider_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../data/shops/shop_unit_model/shop_unit_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../preview_banner/preview_banner.dart';

class PurchaseAmountConfigurator extends StatefulWidget {
  final bool isQRScanned;
  final SliderState sliderState;
  final ShopsUnitModel shopsUnitModel;
  final String previewTitle;
  final bool isToken;

  const PurchaseAmountConfigurator({
    super.key,
    this.isQRScanned = false,
    required this.previewTitle,
    required this.isToken,
    required this.shopsUnitModel,
    required this.sliderState,
  });

  @override
  State<PurchaseAmountConfigurator> createState() =>
      _PurchaseAmountConfiguratorState();
}

class _PurchaseAmountConfiguratorState
    extends State<PurchaseAmountConfigurator> {
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() {
    widget.sliderState.maxGift =
        widget.shopsUnitModel.shopUserTokens[0].giftCardBalance;
    widget.sliderState.maxToken =
        widget.shopsUnitModel.shopUserTokens[0].tokenBalance;
    widget.sliderState.giftValue =
        widget.shopsUnitModel.shopUserTokens[0].giftCardBalance;
    widget.sliderState.tokenValue =
        widget.shopsUnitModel.shopUserTokens[0].tokenBalance;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return widget.isQRScanned == true
          ? Column(
              children: [
                PreviewBanner(
                  leadingBanner: widget.previewTitle,
                  previewStyle: context.theme.body4.bold,
                ),
                const Delimiter(16),
                Row(
                  children: [
                    Container(
                      height: 88,
                      width: context.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.yellowLight.withOpacity(0.3),
                      ),
                      child: PaddingUtility.only(
                        left: 16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'balance.balance'.tr(),
                              style: context.theme.body3.greyDark,
                            ),
                            const Delimiter(4),
                            widget.isToken == true
                                ? Row(
                                    children: [
                                      SizedBox(
                                          height: 20,
                                          width: 21,
                                          child:
                                              Assets.media.icons.token.svg()),
                                      Text(
                                        "${widget.sliderState.maxToken.toInt()}",
                                        style: context.theme.body1.semiBold,
                                      ),
                                    ],
                                  )
                                :  SizedBox(
                                    width: context.width / 3,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: BalanceWidget(
                                        tokenIconWidth: 20,
                                        tokenIconHeight: 18,
                                        textStyle: context.theme.body1.semiBold,
                                        balance: widget.isToken == true
                                            ? widget.sliderState.maxToken
                                                .toInt()
                                            : widget.sliderState.maxGift
                                                .toInt(),
                                        isTokenBalance: widget.isToken,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const Delimiter(8),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 52,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.greyLight),
                                borderRadius: BorderRadius.circular(8)),
                            child: PaddingUtility(
                              all: 16,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.isToken ? widget.sliderState.tokenValue.toInt() : widget.sliderState.giftValue.toInt()}',
                                  style: context.theme.body1,
                                ),
                              ),
                            ),
                          ),
                          Slider(
                            value: widget.isToken == true
                                ? widget.sliderState.tokenValue.toDouble()
                                : widget.sliderState.giftValue.toDouble(),
                            max: widget.isToken == true
                                ? widget.sliderState.maxToken.toDouble()
                                : widget.sliderState.maxGift.toDouble(),
                            onChanged: (double value) {
                              if (widget.isToken) {
                                widget.sliderState
                                    .changeTokenValue(value.toInt());
                              }
                              if (widget.isToken == false) {
                                widget.sliderState
                                    .changeGiftCardLDValue(value.toInt());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                PreviewBanner(
                  leadingBanner: widget.previewTitle,
                  previewStyle: context.theme.body4.bold,
                ),
                const Delimiter(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.greyLight),
                            borderRadius: BorderRadius.circular(8)),
                        child: PaddingUtility(
                          all: 16,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.isToken ? widget.sliderState.tokenValue.toInt() : widget.sliderState.giftValue.toInt()}',
                              style: context.theme.body1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Delimiter(8),
                    Container(
                      height: 52,
                      width: context.width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.whiteGrey),
                      child: Align(
                        alignment: Alignment.center,
                        child: BalanceWidget(
                          leadingTitle: 'shops.max'.tr(),
                          tokenIconWidth: 20,
                          tokenIconHeight: 18,
                          textStyle: context.theme.body1,
                          balance: widget.isToken == true
                              ? widget.sliderState.maxToken.toInt()
                              : widget.sliderState.maxGift.toInt(),
                          isTokenBalance: widget.isToken,
                        ),
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: widget.isToken == true
                      ? widget.sliderState.tokenValue.toDouble()
                      : widget.sliderState.giftValue.toDouble(),
                  max: widget.isToken == true
                      ? widget.sliderState.maxToken.toDouble()
                      : widget.sliderState.maxGift.toDouble(),
                  onChanged: (double value) {
                    if (widget.isToken) {
                      widget.sliderState.changeTokenValue(value.toInt());
                    }
                    if (widget.isToken == false) {
                      widget.sliderState.changeGiftCardLDValue(value.toInt());
                    }
                  },
                ),
              ],
            );
    });
  }
}
