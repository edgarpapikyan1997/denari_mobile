import 'package:denari_app/constants/bottom_sheet_type.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import 'bottom_sheet_upper_piece.dart';

void showQRBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
  required String userID,
  bool isEnabled = false,

  String? token,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        width: context.width,
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetUpperPiece(),
            PaddingUtility.only(
              top: 24,
              child: Text(
                title,
                style: context.theme.headline2.bold,
              ),
            ),
            PaddingUtility.only(
              top: 24,
              bottom: 16,
              child: QrImageView(
                data: userID,
                size: 195,
              ),
            ),
            PaddingUtility.only(
              top: 0,
              bottom: 52,
              left: 21.5,
              right: 21.5,
              child: Text(
                description,
                style: context.theme.body1.lightGreyText,
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              isEnabled: isEnabled,
              isWhite: false,
              title: 'buttons.close'.tr(),
              onTap: () {
                if (isEnabled == true) {
                  context.pop();
                  customBottomSheet(
                    context: context,
                    type: BottomSheetType.congrats,
                    title: 'bottomSheet.congratsEaredToken'.tr(),
                    description: 'Description',
                    asset: Assets.media.images.fireworks.path,
                    tokens: token,
                    balance: '100',
                  );
                }
              },
            ),
          ],
        ),
      );
    },
  );
}
