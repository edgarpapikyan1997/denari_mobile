import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

import 'modal_sheet.dart';

class AlertSheet extends StatelessWidget {
  final Widget alert;
  final String? okLabel;

  const AlertSheet({
    super.key,
    required this.alert,
    this.okLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      closeButton: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: alert,
          ),
          const Delimiter(32),
          ButtonPrimary(
            label: okLabel ?? 'profile.ok'.tr(),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}
