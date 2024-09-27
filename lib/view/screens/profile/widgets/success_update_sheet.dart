import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/alert_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class SuccessUpdateSheet extends StatelessWidget {
  const SuccessUpdateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertSheet(
      alert: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.media.icons.fireworks.svg(),
          const Delimiter(),
          Text(
            'profile.update_success'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(),
        ],
      ),
    );
  }
}
