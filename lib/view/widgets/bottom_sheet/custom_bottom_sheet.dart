import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import '../../../constants/bottom_sheet_type.dart';
import '../../../utils/themes/app_colors.dart';
import '../balance_widget.dart';
import '../rate_widget/rate_widget.dart';
import 'bottom_sheet_upper_piece.dart';

void customBottomSheet({
  required BuildContext context,
  required BottomSheetType type,
  required String title,
  required String description,
  String? rateText,
  String? tokens,
  String? balance,
  String? asset,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        switch (type) {
          case BottomSheetType.congrats:
            return _buildCongratsBottomSheet(
                context, asset, title, tokens, balance);
          case BottomSheetType.alert:
            return _buildAlertBottomSheet(context, asset);
          case BottomSheetType.custom:
            return _buildCustomBottomSheet(context, asset);
          default:
            return Container();
        }
      });
}

Widget _buildCongratsBottomSheet(BuildContext context, String? asset,
    String? title, String? tokens, String? balance) {
  return Container(
    width: context.width,
    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
    decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetUpperPiece(),
        PaddingUtility.only(
          top: 36,
          bottom: 24,
          child: asset != null && asset.isNotEmpty
              ? Image.asset(asset)
              : const SizedBox(),
        ),
        PaddingUtility.only(
          left: 35,
          right: 35,
          bottom: 16,
          child: Text(
            title!,
            style: context.theme.headline2.bold,
            textAlign: TextAlign.center,
          ),
        ),
        tokens != null
            ? Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.searchBarColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IntrinsicWidth(
                  child: BalanceWidget(
                    balance: tokens,
                    textStyle: context.theme.headline4.medium,
                    isTokenBalance: true,
                    tokenIconWidth: 13,
                    tokenIconHeight: 14,
                    addPlusChar: true,
                    title: 'tokens',
                  ),
                ),
              )
            : const SizedBox(),
        PaddingUtility.only(
          left: 35,
          right: 35,
          bottom: 64,
          child: Text(
            "${'bottomSheet.yourPurchase'.tr()}$balance ${"bottomSheet.at".tr()} [User Name] ${"bottomSheet.earnedYou".tr()} $tokens ${'balance.tokens'.tr()}",
            style: context.theme.headline4.regular.lightGreyText,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'bottomSheet.wouldYouRate'.tr(),
          style: context.theme.headline4.regular,
        ),
        RateWidget(),
      ],
    ),
  );
}

Widget _buildAlertBottomSheet(BuildContext context, String? asset) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Congratulations!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Widget _buildCustomBottomSheet(BuildContext context, String? asset) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Custom Bottom Sheet',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // if (asset != null) asset,
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
