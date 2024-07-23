import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;
  const DividerText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: Divider(height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        const Flexible(child: Divider(height: 1)),
      ],
    );
  }
}
