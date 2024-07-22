import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/balance_widget.dart';

class BrandItemWidget extends StatelessWidget {
  final String avatar;
  final String brandName;
  final String? secondaryInfo;
  final String? tokenBalance;
  final Widget? tealButton;

  const BrandItemWidget({
    super.key,
    required this.avatar,
    required this.brandName,
    this.secondaryInfo,
    this.tokenBalance,
    this.tealButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(avatar),
                  ),
                  border: Border.all(width: 1, color: AppColors.borderColor)),
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
                        style: context.theme.headline4.medium,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        secondaryInfo!,
                        style: context.theme.body3.lightGreyText,
                      ),
                    ],
                  )
                : Text(
                    brandName,
                    style: context.theme.headline4.regular,
                  ),
            const Spacer(),
            tokenBalance != null
                ? BalanceWidget(
                    isTokenBalance: secondaryInfo != null ? true : false,
                    tokenIconHeight: 20,
                    tokenIconWidth: 18,
                    balance: tokenBalance!,
                    textStyle: context.theme.headline4,
                  )
                : const SizedBox(),
            tealButton ?? const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          color: AppColors.borderColor,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
