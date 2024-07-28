import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/modal_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/switch_text.dart';
import 'package:flutter/material.dart';

class LocationSheet extends StatelessWidget {
  const LocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.location_services'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(8),
          SwitchText(
            text: 'profile.use_gps'.tr(),
            onChanged: (value) => {},
          ),
        ],
      ),
    );
  }
}
