import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String message;
  final DateTime date;

  const NotificationItem({
    super.key,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.media.icons.info.svg(),
        const Delimiter(8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message, style: context.theme.body1),
            const Delimiter(2),
            Text(
              date.printFull(),
              style:
                  context.theme.body3.copyWith(color: AppColors.lightGreyText),
            ),
          ],
        ),
      ],
    );
  }
}
