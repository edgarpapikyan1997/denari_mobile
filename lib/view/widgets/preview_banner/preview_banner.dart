import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class PreviewBanner extends StatelessWidget {
  final Widget? leadingBanner;
  final Widget? middleBanner;
  final Widget? textButton;
  final String? bannerUnderText;

  const PreviewBanner(
      {super.key,
      this.leadingBanner,
      this.middleBanner,
      this.textButton,
      this.bannerUnderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leadingBanner ?? SizedBox(),
            middleBanner ?? SizedBox(),
            textButton ?? SizedBox(),
          ],
        ),
        bannerUnderText != null
            ? const SizedBox(
                height: 8,
              )
            : const SizedBox(),
        bannerUnderText != null
            ? Text(
                bannerUnderText!,
                style: context.theme.headline4.regular.yellowDark,
              )
            : const SizedBox()
      ],
    );
  }
}
