import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/buttons/button_outline.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

import 'modal_sheet.dart';

class QuestionSheet extends StatelessWidget {
  final Widget question;
  final String? cancelLabel;
  final String? okLabel;

  const QuestionSheet({
    super.key,
    required this.question,
    this.cancelLabel,
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
            child: question,
          ),
          const Delimiter(32),
          Row(
            children: [
              Flexible(
                child: ButtonOutline(
                  label: cancelLabel ?? 'profile.cancel'.tr(),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
              const Delimiter(),
              Flexible(
                child: ButtonPrimary(
                  label: okLabel ?? 'profile.ok'.tr(),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
