import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonMenu extends StatelessWidget {
  final String label;
  final String svg;
  final Function() onPressed;
  final Color? iconColor;

  const ButtonMenu({
    super.key,
    required this.label,
    required this.svg,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(
              svg,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                iconColor ?? context.theme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const Delimiter(8),
            Text(
              label,
              maxLines: 1,
              style: context.theme.body1,
            ),
            const Spacer(),
            Assets.media.icons.chevronRight.svg()
          ],
        ),
      ),
    );
  }
}
