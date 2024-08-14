import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PreviewBanner extends StatelessWidget {
  final Widget? leadingWidget;
  final String? leadingBanner;
  final Widget? middleBanner;
  final Widget? tealButton;
  final String? bannerUnderText;
  final TextStyle? previewStyle;

  const PreviewBanner(
      {super.key,
      this.leadingWidget,
      this.leadingBanner,
      this.middleBanner,
      this.tealButton,
      this.bannerUnderText,
      this.previewStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leadingWidget != null
                ? leadingWidget!
                : Text(
                    leadingBanner ?? '',
                    style: previewStyle ?? context.theme.headline2.bold,
                  ),
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
