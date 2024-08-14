import 'package:denari_app/store/filters/slider_state/slider_state.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../utils/themes/app_colors.dart';
import '../../preview_banner/preview_banner.dart';

class PurchaseAmountConfigurator extends StatefulWidget {
  final String previewTitle;
  final bool isToken;

  const PurchaseAmountConfigurator({
    super.key,
    required this.previewTitle,
    required this.isToken,
  });

  @override
  State<PurchaseAmountConfigurator> createState() =>
      _PurchaseAmountConfiguratorState();
}

class _PurchaseAmountConfiguratorState
    extends State<PurchaseAmountConfigurator> {
  SliderState sliderState = SliderState();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
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
                      border: Border.all(width: 1, color: AppColors.greyLight),
                      borderRadius: BorderRadius.circular(8)),
                  child: PaddingUtility(
                    all: 16,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.isToken ? sliderState.giftValue.toInt() : sliderState.tokenValue.toInt()}',
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
                      tokenIconWidth: 20,
                      tokenIconHeight: 18,
                      textStyle: context.theme.body1,
                      balance: widget.isToken == true
                          ? sliderState.maxToken.toInt()
                          : sliderState.maxGift.toInt(),
                      isTokenBalance: widget.isToken,

                    )),
              ),
            ],
          ),
          Slider(
            value: widget.isToken == true
                ? sliderState.tokenValue
                : sliderState.giftValue,
            max: widget.isToken == true
                ? sliderState.maxToken
                : sliderState.maxGift,
            onChanged: (double value) {
              sliderState.changeValue(value);
            },
          ),
        ],
      );
    });
  }
}
