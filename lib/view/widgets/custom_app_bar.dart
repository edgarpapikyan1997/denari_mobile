import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../utils/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final Color? appBarColor;
  final Widget? leadingIcon;
  final String? tokenCount;
  final Text? title;
  final Widget? tealIcon;

  const CustomAppBar(
      {super.key,
      this.leadingIcon,
      this.tokenCount,
      this.title,
      this.tealIcon, this.appBarColor});

  Widget tokenAppBar(BuildContext context) {
    return Row(
      children: [
        leadingIcon != null
            ? SizedBox(height: 28, width: 26, child: leadingIcon)
            : const SizedBox(),
        const SizedBox(
          width: 8,
        ),
        Text(
          tokenCount ?? '',
          style: context.theme.headline2.bold,
        ),
        Spacer(),
        tealIcon != null
            ? SizedBox(width: 24, height: 24, child: tealIcon)
            : const SizedBox(),
      ],
    ).paddingOnly(top: 60, left: 16, right: 16, bottom: 16);
  }

  Widget defaultAppBar() {
    return Row(
      children: [
        leadingIcon != null
            ? SizedBox(height: 28, width: 26, child: leadingIcon)
            :
        const SizedBox(
                width: 24,
                height: 24,
              ),
        Spacer(),
        title ?? SizedBox(),
        Spacer(),
        tealIcon != null
            ? SizedBox(child: tealIcon)
            : const SizedBox(
                width: 24,
                height: 24,
              ),
      ],
    ).paddingOnly(top: 60, left: 16, right: 16, bottom: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
      width: context.width,
      child: tokenCount != null ? tokenAppBar(context) : defaultAppBar(),
    );
  }
}
