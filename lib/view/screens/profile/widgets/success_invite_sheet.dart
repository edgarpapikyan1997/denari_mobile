import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/alert_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/tokens_chip.dart';
import 'package:flutter/material.dart';

class SuccessInviteSheet extends StatelessWidget {
  const SuccessInviteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertSheet(
      alert: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.media.icons.fireworks.svg(),
          const Delimiter(),
          Text(
            'profile.invite_success'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(),
          const TokensChip(count: 5),
          const Delimiter(),
          Text(
            'profile.invite_success_desc'.tr(),
            style: context.theme.body1.copyWith(color: AppColors.lightGreyText),
          ),
        ],
      ),
    );
  }
}
