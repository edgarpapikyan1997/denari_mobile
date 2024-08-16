import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/balance_widget.dart';
import '../delimiter.dart';

class BrandItemWidget extends StatelessWidget {
  final String? avatar;
  final String brandName;
  final Widget? secondaryInfo;
  final int? tokenBalance;
  final int? balanceLD;
  final Widget? tealButton;
  final bool addDivider;
  final DateTime? lastUpdate;
  final DateTime? purchaseDate;
  final SvgPicture? iconAvatar;
  final Color tokenColor;
  final Color balanceColor;
  final TextStyle? balanceLDStyle;
  final TextStyle? tokenBalanceStyle;
  final double iconHeight;
  final double iconWidth;
  final bool addPlus;

  const BrandItemWidget({
    super.key,
    required this.avatar,
    required this.brandName,
    this.secondaryInfo,
    this.tokenBalance,
    this.balanceLD,
    this.tealButton,
    this.addDivider = true,
    this.tokenColor = AppColors.white,
    this.balanceColor = AppColors.white,
    this.lastUpdate,
    this.purchaseDate,
    this.iconAvatar,
    this.balanceLDStyle,
    this.tokenBalanceStyle,
    this.iconHeight = 20,
    this.iconWidth = 10,
    this.addPlus = false,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Delimiter(16),
        Row(
          children: [
            iconAvatar != null
                ? iconAvatar!
                : Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(avatar!),
                      ),
                      border:
                          Border.all(width: 1, color: AppColors.borderColor),
                    ),
                  ),
            const SizedBox(
              width: 8,
            ),
            secondaryInfo != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandName,
                        style: context.theme.body1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      secondaryInfo!,
                    ],
                  )
                : Text(
                    brandName,
                    style: context.theme.headline4.regular,
                  ),
            const Spacer(),
            Column(
              children: [
                balanceLD != null
                    ? BalanceWidget(
                        isTokenBalance: false,
                        tokenIconHeight: 20,
                        tokenIconWidth: 18,
                        balance: balanceLD!,
                        textStyle: balanceLDStyle ?? context.theme.headline4,
                        color: balanceColor,
                      )
                    : SizedBox(),
                if (tokenBalance != null && balanceLD != null)
                  const Delimiter(4),
                tokenBalance != null
                    ? BalanceWidget(
                        isTokenBalance: true,
                        horizontalPadding: 5,
                        verticalPadding: 2,
                        tokenIconHeight: iconHeight,
                        tokenIconWidth: iconWidth,
                        balance: tokenBalance!,
                        textStyle: tokenBalanceStyle ?? context.theme.headline4,
                        color: tokenColor,
                        addPlusChar: addPlus,
                      )
                    : SizedBox(),
              ],
            ),
            tealButton ?? const SizedBox(),
          ],
        ),
        addDivider
            ? const SizedBox(
                height: 16,
              )
            : const SizedBox(),
        addDivider
            ? const Divider(
                height: 1,
                color: AppColors.borderColor,
              )
            : const SizedBox(),
      ],
    );
  }
}
