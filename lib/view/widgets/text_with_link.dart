import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithLink extends StatelessWidget {
  final String text;
  final String link;
  final GestureTapCallback onTap;

  const TextWithLink({
    super.key,
    required this.text,
    required this.link,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text),
          const WidgetSpan(child: Delimiter(6)),
          TextSpan(
            text: link,
            style: context.theme.bodyText1.copyWith(
              color: context.theme.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
