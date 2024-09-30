import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/themes/app_colors.dart';

class DataPicker extends StatelessWidget {
  final DateTime? sourceDate;
  final VoidCallback? onTap;

  const DataPicker({
    super.key,
    this.sourceDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyLight),
            borderRadius: BorderRadius.circular(8)),
        width: context.width,
        height: 52,
        child: PaddingUtility.symmetric(
          horizontal: 16,
          vertical: 14,
          child: Row(
            children: [
              sourceDate != null
                  ? Text(
                      DateFormat('dd MM, yyyy').format(sourceDate!),
                      style: context.theme.body1,
                    )
                  : Text(
                      'End',
                      style: context.theme.body1,
                    ),
              const Spacer(),
              Assets.media.icons.calendarDays.svg()
            ],
          ),
        ),
      ),
    );
  }
}
