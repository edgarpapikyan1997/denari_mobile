import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class BalanceWidget extends StatelessWidget {
  final String? leadingTitle;
  final bool isTokenBalance;
  final bool addPlusChar;
  final double tokenIconHeight;
  final double tokenIconWidth;
  final double horizontalPadding;
  final double verticalPadding;
  final int balance;
  final TextStyle? textStyle;
  final String title;
  final Color? color;
  final VoidCallback? onTap;

  const BalanceWidget({
    super.key,
    this.leadingTitle,
    this.isTokenBalance = false,
    this.addPlusChar = false,
    this.tokenIconHeight = 25,
    this.tokenIconWidth = 28,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    required this.balance,
    this.textStyle,
    this.title = "",
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: isTokenBalance
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  leadingTitle != null
                      ? Text(
                          "$leadingTitle ",
                          style: textStyle,
                        )
                      : const SizedBox(),
                  Assets.media.icons.token
                      .svg(height: tokenIconHeight, width: tokenIconWidth),
                  const SizedBox(width: 4),
                  Text(
                    addPlusChar ? "+$balance $title" : balance.toString(),
                    style: textStyle ?? context.theme.body1.medium,
                  ),
                ],
              )
            : Text(
                leadingTitle != null
                    ? '$leadingTitle $balance ${'balance.ld'.tr()}'
                    : '$balance ${'balance.ld'.tr()}',
                style: textStyle,
              ),
      ),
    );
  }
}
