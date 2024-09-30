import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TokensChip extends StatelessWidget {
  final int count;

  const TokensChip({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteGrey,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.media.icons.token.svg(),
            Text(
              'profile.tokens'.tr(args: [count.toString()]),
              style: context.theme.button,
            ),
          ],
        ),
      ),
    );
  }
}
