import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.media.icons.alarmBell.svg(),
          const Delimiter(24),
          Text(
            'notifications.no'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(8),
          Text(
            'notifications.empty'.tr(),
            textAlign: TextAlign.center,
            style: context.theme.body1.copyWith(color: AppColors.lightGreyText),
          ),
        ],
      ),
    );
  }
}
