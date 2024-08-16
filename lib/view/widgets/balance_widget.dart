import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class BalanceWidget extends StatelessWidget {
  final bool isTokenBalance;
  final bool addPlusChar;
  final double tokenIconHeight;
  final double tokenIconWidth;
  final double horizontalPadding;
  final double verticalPadding;
  final int balance;
  final TextStyle textStyle;
  final String title;
  final Color? color;
  final VoidCallback? onTap;

  const BalanceWidget({
    super.key,
    this.isTokenBalance = false,
    required this.textStyle,
    required this.balance,
    this.tokenIconHeight = 25,
    this.tokenIconWidth = 28,
    this.addPlusChar = false,
    this.title = "",
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: isTokenBalance
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.media.icons.token
                    .svg(height: tokenIconHeight, width: tokenIconWidth),
                const SizedBox(width: 4),
                Text(
                  addPlusChar ? "+$balance $title" : balance.toString(),
                  style: textStyle,
                ),
              ],
            )
            : Text(
                '$balance ${'balance.ld'.tr()}',
                style: textStyle,
              ),
      ),
    );
  }
}
