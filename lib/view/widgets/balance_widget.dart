import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';

class BalanceWidget extends StatelessWidget {
  final bool isTokenBalance;
  final double tokenIconHeight;
  final double tokenIconWidth;
  final String balance;
  final TextStyle textStyle;

  const BalanceWidget({
    super.key,
    this.isTokenBalance = false,
    required this.textStyle,
    required this.balance,
    this.tokenIconHeight = 25,
    this.tokenIconWidth = 28,
  });

  @override
  Widget build(BuildContext context) {
    return isTokenBalance
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.media.icons.token
                  .svg(height: tokenIconHeight, width: tokenIconWidth),
              const SizedBox(width: 4),
              Text(
                balance,
                style: textStyle,
              )
            ],
          )
        : Text(
            '$balance ${'balance.ld'.tr()}',
            style: textStyle,
          );
  }
}
