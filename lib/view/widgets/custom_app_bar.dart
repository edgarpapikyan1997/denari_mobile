import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'balance_widget.dart';

class CustomAppBar extends StatelessWidget {
  final Color? appBarColor;
  final Widget? leadingIcon;
  final int? tokenBalance;
  final Text? title;
  final Widget? tealIcon;

  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.tokenBalance,
    this.title,
    this.tealIcon,
    this.appBarColor,
  });

  Widget tokenAppBar(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.go('/tokenBalance');
          },
          child: BalanceWidget(
            isTokenBalance: tokenBalance != null ? true : false,
            tokenIconHeight: 28,
            tokenIconWidth: 26,
            balance: tokenBalance!,
            textStyle: context.theme.headline2.bold,
          ),
        ),
        const Spacer(),
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
            : const SizedBox(
                width: 24,
                height: 24,
              ),
        const Spacer(),
        title ?? const SizedBox(),
        const Spacer(),
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
      height: 104,
      color: appBarColor,
      width: context.width,
      child: tokenBalance != null ? tokenAppBar(context) : defaultAppBar(),
    );
  }
}
