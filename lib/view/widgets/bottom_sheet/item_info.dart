import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:denari_app/view/widgets/status_widget/status_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/themes/app_colors.dart';
import '../delimiter.dart';

class ItemInfo extends StatelessWidget {
  final String? id;
  final StatusWidget status;
  final String? storeAddress;
  final String? commentByStore;
  final int? transactionAmount;
  final int? tokensAddedAmount;
  final int? amountTokensUsed;
  final int? amountGiftCardsUsed;

  const ItemInfo({
    super.key,
    this.id,
    required this.status,
    this.storeAddress,
    this.transactionAmount,
    this.tokensAddedAmount,
    this.amountTokensUsed,
    this.amountGiftCardsUsed,
    this.commentByStore = '',
  });

  Row itemInfoUnit({
    required BuildContext context,
    required String title,
    required Widget value,
    bool addSpacer = false,
    TextStyle? titleStyle,
  }) {
    return Row(
      mainAxisAlignment:
          addSpacer ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? context.theme.body4.semiBold,
        ),
        const SizedBox(
          width: 8,
        ),
        value,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.only(
      top: 32,
      child: Column(
        children: [
          itemInfoUnit(
            context: context,
            title: 'transaction.id'.tr(),
            value: Text(id ?? '', style: context.theme.body3),
          ),
          const Delimiter(16),
          itemInfoUnit(
            context: context,
            title: 'transaction.status'.tr(),
            value: status,
          ),
          const Delimiter(24),
          PreviewBanner(
            leadingBanner: 'transaction.storeAddress'.tr(),
            bannerUnderText: storeAddress,
            underTextStyle: context.theme.body1,
          ),
          const Delimiter(24),
          PreviewBanner(
            leadingBanner: 'transaction.details'.tr(),
          ),
          const Delimiter(12),
          itemInfoUnit(
            context: context,
            title: 'transaction.transactionAmount'.tr(),
            value: BalanceWidget(
              balance: transactionAmount ?? 0,
              textStyle: context.theme.body1.semiBold,
            ),
            addSpacer: true,
            titleStyle: context.theme.body1,
          ),
          const Delimiter(12),
          itemInfoUnit(
            context: context,
            title: 'transaction.tokensAddedAmount'.tr(),
            value: BalanceWidget(
              isTokenBalance: true,
              tokenIconWidth: 18,
              tokenIconHeight: 20,
              balance: tokensAddedAmount ?? 0,
              textStyle: context.theme.body1.semiBold,
            ),
            addSpacer: true,
            titleStyle: context.theme.body1,
          ),
          const Delimiter(12),
          itemInfoUnit(
            context: context,
            title: 'transaction.transactionAmount'.tr(),
            value: BalanceWidget(
              isTokenBalance: true,
              tokenIconWidth: 18,
              tokenIconHeight: 20,
              balance: amountTokensUsed ?? 0,
              textStyle: context.theme.body1.semiBold,
            ),
            addSpacer: true,
            titleStyle: context.theme.body1,
          ),
          const Delimiter(12),
          itemInfoUnit(
            context: context,
            title: 'transaction.transactionAmount'.tr(),
            value: BalanceWidget(
              balance: amountGiftCardsUsed ?? 0,
              textStyle: context.theme.body1.semiBold,
            ),
            addSpacer: true,
            titleStyle: context.theme.body1,
          ),
         commentByStore!.isEmpty != true
              ? Column(
                  children: [
                    const Delimiter(24),
                    PreviewBanner(
                      leadingBanner: 'transaction.commentByStore'.tr(),
                    ),
                    const Delimiter(12),
                    Container(
                      width: context.width,
                      // height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.whiteGrey),
                      child: Center(
                        child: Text(
                          commentByStore!,
                          style: context.theme.body1,
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
