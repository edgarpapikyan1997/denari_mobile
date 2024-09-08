import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/balance_widget.dart';

class BrandItemWidget extends StatelessWidget {
  final String? avatar;
  final String brandName;
  final bool isToken;
  final Color wrapperColor;
  final Color? brandItemWrapperColor;
  final Widget? secondaryInfo;
  final int? tokenBalance;
  final Widget? tealButton;
  final bool addDivider;
  final double bottomPadding;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final String? lastUpdate;
  final SvgPicture? iconAvatar;

  const BrandItemWidget({
    super.key,
    this.brandItemWrapperColor,
    required this.avatar,
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaddingUtility.only(
          top: 16,
          child: Container(
            decoration: BoxDecoration(
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
                          border:
                              Border.all(width: 1, color: AppColors.borderColor),
                        ),
                      ),
                const SizedBox(
                  width: 8,
                ),
                secondaryInfo != null
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              brandName,
                              style: context.theme.body1,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                                width: context.width / 1.5,
                                child: secondaryInfo!),
                          ],
                        ),
                      )
                    : Text(
                        brandName,
                        style: context.theme.headline4.regular,
                      ),
                const Spacer(),
                tokenBalance != null
                    ? BalanceWidget(
                        isTokenBalance: isToken,
                        tokenIconHeight: 20,
                        tokenIconWidth: 18,
                        horizontalPadding: 12,
                        verticalPadding: 6,
                        balance: tokenBalance!,
                        textStyle: context.theme.headline4,
                        color: wrapperColor,
                      )
                    : const SizedBox(),
                tealButton ?? const SizedBox(),
              ],
            ),
          ),
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
