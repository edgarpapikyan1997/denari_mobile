import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/alert_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class SuccessOperationSheet extends StatelessWidget {
  final String message;
  const SuccessOperationSheet({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertSheet(
      alert: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.media.icons.fireworks.svg(),
          const Delimiter(),
          Text(
            message,
            style: context.theme.headline2,
          ),
          const Delimiter(),
        ],
      ),
    );
  }
}
