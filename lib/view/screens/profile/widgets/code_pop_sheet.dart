import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/question_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class CodePopSheet extends StatelessWidget {
  const CodePopSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSheet(
      question: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.media.icons.safetyWarningHeat.svg(),
          const Delimiter(),
          Text(
            'profile.are_you_sure'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(),
          Text(
            'profile.you_want_stop_verification'.tr(),
            style: context.theme.body1.copyWith(
              color: AppColors.lightGreyText,
            ),
          ),
          const Delimiter(),
        ],
      ),
      okLabel: 'profile.log_out'.tr(),
    );
  }
}
