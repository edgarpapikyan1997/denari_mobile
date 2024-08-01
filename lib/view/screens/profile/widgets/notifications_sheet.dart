import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/switch_text.dart';
import 'package:flutter/material.dart';

class NotificationsSheet extends StatelessWidget {
  const NotificationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.notifications'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(8),
          SwitchText(
            text: 'profile.transaction_notifications'.tr(),
            onChanged: (value) => {},
          ),
          const Divider(height: 1, color: AppColors.bottomSheetPieceGrey),
          SwitchText(
            text: 'profile.advertisements'.tr(),
            onChanged: (value) => {},
          ),
        ],
      ),
    );
  }
}
