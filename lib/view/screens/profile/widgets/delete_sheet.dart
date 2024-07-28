import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/question_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class DeleteSheet extends StatelessWidget {
  const DeleteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSheet(
      question: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.are_you_want_delete'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${'profile.warning'.tr()}: ',
                  style: context.theme.headline4,
                ),
                TextSpan(
                  text: 'profile.warning_delete_desc'.tr(),
                  style: context.theme.body1.copyWith(
                    color: AppColors.lightGreyText,
                  ),
                ),
              ],
            ),
          ),
          const Delimiter(),
          Text(
            'profile.warning_delete_desc_2'.tr(),
            style: context.theme.body1.copyWith(
              color: AppColors.lightGreyText,
            ),
          ),
          const Delimiter(),
          Text(
            'profile.are_you_want_delete'.tr(),
            style: context.theme.headline4,
          ),
        ],
      ),
      okLabel: 'profile.no'.tr(),
      cancelLabel: 'profile.yes'.tr(),
    );
  }
}
