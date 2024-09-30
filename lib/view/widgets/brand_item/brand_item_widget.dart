import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/balance_widget.dart';
import '../delimiter.dart';

class BrandItemWidget extends StatelessWidget {
  final String? avatar;
  final String brandName;
  final bool isToken;
  final Color wrapperColor;
  final Color? brandItemWrapperColor;
  final Widget? secondaryInfo;
  final int? tokenBalance;
  final int? balanceLD;
  final Widget? tealButton;
  final bool addDivider;
  final double bottomPadding;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final String? lastUpdate;
  final DateTime? purchaseDate;
  final SvgPicture? iconAvatar;
  final String? shopId;
  final Color? tokenColor;
  final Color? balanceColor;
  final TextStyle? balanceLDStyle;
  final TextStyle? tokenBalanceStyle;
  final double iconHeight;
  final double iconWidth;
  final bool addPlus;
  final bool addPreviewBanner;
  final VoidCallback? onTap;
  final List<BalanceWidget>? balanceWidgets;
  final bool? isCheckBoxSelected;

  const BrandItemWidget({
    super.key,
    this.brandItemWrapperColor,
    this.avatar,
    required this.brandName,
    this.isToken = false,
    this.secondaryInfo,
    this.tokenBalance,
    this.tealButton,
    this.addDivider = true,
    this.bottomPadding = 0,
    this.topPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.wrapperColor = AppColors.white,
    this.lastUpdate,
    this.iconAvatar,
    this.balanceLD,
    this.purchaseDate,
    this.tokenColor,
    this.balanceColor,
    this.balanceLDStyle,
    this.tokenBalanceStyle,
    this.iconHeight = 24,
    this.iconWidth = 24,
    this.addPlus = false,
    this.addPreviewBanner = false,
    this.onTap,
    this.shopId,
    this.balanceWidgets,
    this.isCheckBoxSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          PaddingUtility.only(
            top: topPadding,
            bottom: bottomPadding,
            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: brandItemWrapperColor,
              ),
              child: Row(
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
                              fit: BoxFit.fill,
                              image: NetworkImage(avatar!),
                            ),
                            border: Border.all(
                                width: 1, color: AppColors.borderColor),
                          ),
                        ),
                  const Delimiter(8),
                  Expanded(
                    child: secondaryInfo != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                brandName,
                                style: context.theme.body1,
                              ),
                              const SizedBox(height: 2),
                              secondaryInfo!,
                            ],
                          )
                        : Text(
                            brandName,
                            style: context.theme.headline4.regular,
                          ),
                  ),
                  balanceWidgets != null
                      ? Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: balanceWidgets ?? [],
                          ),
                      )
                      : const SizedBox(),
                  tealButton ?? const SizedBox(),
                ],
              ),
            ),
          ),
          // addDivider
          //     ? const SizedBox(
          //         height: 8,
          //       )
          //     : const SizedBox(),
          addDivider
              ? const Divider(
                  height: 1,
                  color: AppColors.borderColor,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
