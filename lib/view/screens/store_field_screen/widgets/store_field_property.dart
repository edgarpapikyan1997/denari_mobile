import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/themes/app_colors.dart';

class StoreFieldProperty extends StatelessWidget {
  final bool isRow;
  final SvgPicture? asset;
  final String title;
  final Widget? secondaryValue;
  final VoidCallback? onTap;

  const StoreFieldProperty({
    super.key,
    this.isRow = true,
    this.asset,
    required this.title,
    this.secondaryValue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isRow
          ? Row(
              children: [
                asset!,
                const Delimiter(8),
                Text(
                  title,
                  style: context.theme.body1,
                ),
                const Spacer(),
                Text(
                  'main.seeAll'.tr(),
                  style: context.theme.body1.yellowDark,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Assets.media.icons.chevronRight.svg(),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.theme.body3.lightGreyText,
                ),
                const Delimiter(8),
                secondaryValue ?? const SizedBox()
              ],
            ),
    );
  }
}
