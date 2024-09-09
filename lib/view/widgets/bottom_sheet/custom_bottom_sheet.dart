import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/bottom_sheet_upper_piece.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/bottom_sheet_type.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../custom_button.dart';
import 'custom_buttom_sheet_moods/congrats_mood.dart';

void customBottomSheet({
  required BuildContext context,
  required BottomSheetType type,
  required String title,
  String? description,
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
