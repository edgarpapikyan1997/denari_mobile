import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PreviewBanner extends StatelessWidget {
  final Widget? leadingBanner;
  final Widget? middleBanner;
  final Widget? tealButton;
  final String? bannerUnderText;

  const PreviewBanner(
      {super.key,
      this.leadingBanner,
      this.middleBanner,
      this.tealButton,
      this.bannerUnderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leadingBanner ?? const SizedBox(),
            middleBanner ?? const SizedBox(),
            tealButton ?? const SizedBox(),
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
                style: context.theme.headline4.regular.lightGreyText,
              )
            : const SizedBox()
      ],
    );
  }
}
