import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:denari_app/view/widgets/app_bar/image_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'balance_widget.dart';

class CustomAppBar extends StatelessWidget {
  final Color? appBarColor;
  final Widget? leadingIcon;
  final int? tokenBalance;
  final Text? title;
  final Widget? tealIcon;
  final AppBarType appBarType;
  final List<String>? imageList;

  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.tokenBalance,
    this.title,
    this.tealIcon,
    this.appBarColor,
    this.appBarType = AppBarType.regular,
    this.imageList,
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

  Widget imageAppBar(BuildContext context) {
    return ImageAppBar(
      leadingIcon: leadingIcon,
      imageList: imageList,
    );
  }

  Widget chooseOption({
    required AppBarType appBarType,
    required BuildContext context,
  }) {
    switch (appBarType) {
      case AppBarType.token:
        return tokenAppBar(context);
      case AppBarType.regular:
        return defaultAppBar();
      case AppBarType.image:
        return imageAppBar(context);
      default:
        return defaultAppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: appBarType == AppBarType.image
            ? AppSizes.backGroundImagePrefSize.height
            : AppSizes.prefSizes.height,
        color: appBarColor,
        width: context.width,
        child: chooseOption(appBarType: appBarType, context: context));
  }
}
