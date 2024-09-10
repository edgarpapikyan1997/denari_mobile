import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/bottom_sheet_upper_piece.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/bottom_sheet_type.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../custom_button.dart';
import 'custom_buttom_sheet_moods/congrats_mood.dart';

void customBottomSheet({
  bool isToken = false,
  required BuildContext context,
  required BottomSheetType type,
  required String title,
  required String description,
  String? brandName,
  String? rateText,
  String? tokens,
  String? balance,
  int sendingBalance = 0,
  String? asset,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        switch (type) {
          case BottomSheetType.congrats:
            return _buildCongratsBottomSheet(
              context,
              asset,
              title,
              tokens,
              balance,
            );
          case BottomSheetType.alert:
            return _buildAlertBottomSheet(context,
                title: title, description: description);
          case BottomSheetType.custom:
            return _buildCustomBottomSheet(context, asset);
          case BottomSheetType.sendingCongrats:
            return _buildSendingCongratsBottomSheet(
                context: context,
                title: title,
                description: description,
                brandName: brandName!,
                avatar: asset!,
                isToken: isToken,
                sendingBalance: sendingBalance);

          default:
            return Container();
        }
      });
}

Widget _buildCongratsBottomSheet(
  BuildContext context,
  String? asset,
  String? title,
  String? tokens,
  String? balance,
) {
  return CongratsMood(
    asset: asset,
    title: title,
    tokens: tokens,
    balance: balance,
  );
}

Widget _buildSendingCongratsBottomSheet({
  required isToken,
  required BuildContext context,
  required String avatar,
  required String description,
  required String title,
  required int sendingBalance,
  String? brandName,
}) {
  return Container(
    width: context.width,
    decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(15)),
    child: PaddingUtility.only(
      bottom: 45,
      top: 8,
      left: 16,
      right: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetUpperPiece(),
          const Delimiter(36),
          Assets.media.images.fireworks.image(),
          const Delimiter(24),
          Text(
            title,
            style: context.theme.headline2.bold,
          ),
          PaddingUtility.only(
            top: 8,
            bottom: 24,
            left: 60,
            right: 60,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: isToken != null
                    ? "${'main.tokenWillSend'.tr()} "
                    : "${'main.giftWillSend'.tr()} ",
                style: context.theme.body1.lightGreyText.height1,
                children: <TextSpan>[
                  TextSpan(
                      text: description,
                      style: context.theme.body1.black.medium.height1),
                ],
              ),
            ),
          ),
          BrandItemWidget(
            topPadding: 8,
            wrapperColor: AppColors.whiteGrey,
            brandItemWrapperColor: AppColors.whiteGrey,
            addDivider: false,
            avatar: avatar,
            brandName: brandName ?? '',
            isToken: isToken,
            tokenBalance: sendingBalance,
          ),
          const Delimiter(48),
          CustomButton(
              isEnabled: true,
              isWhite: false,
              title: 'main.backToHome'.tr(),
              onTap: () async {
               await  Future.delayed(const Duration(milliseconds: 300)).then((value) {
                 context.go('/');
               });
              })
        ],
      ),
    ),
  );
}

Widget _buildAlertBottomSheet(BuildContext context,
    {String? title, String? description}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    width: context.width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Delimiter(8),
        const BottomSheetUpperPiece(),
        const Delimiter(45),
        Assets.media.images.safetyWarningHeat.image(),
        const Delimiter(24),
        Text(
          '$title',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Delimiter(8),
        PaddingUtility.only(
          left: 47,
          right: 47,
          child: Text(
            '$description',
            style: context.theme.body1.greyLight,
            textAlign: TextAlign.center,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        const Delimiter(48),
        PaddingUtility.symmetric(
          horizontal: 16,
          vertical: 0,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    context.pop();
                  },
                  title: 'profile.no'.tr(),
                  isWhite: true,
                  isEnabled: true,
                ),
              ),
              const Delimiter(8),
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  title: 'profile.yes'.tr(),
                  isWhite: false,
                  isEnabled: true,
                ),
              ),
            ],
          ),
        ),
        const Delimiter(46),
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
        const Text(
          'Custom Bottom Sheet',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
