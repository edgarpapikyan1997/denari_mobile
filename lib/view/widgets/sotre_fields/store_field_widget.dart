import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class StoreFieldWidget extends StatelessWidget {
  final Widget? asset;
  final String? title;
  final String? description;

  const StoreFieldWidget(
      {super.key,
      required this.asset,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 8, bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey),
          width: 128,
          height: 148,
        ),
        Text(
          title ?? '',
          style: context.theme.headline3,
        ),
        Text(
          description ?? '',
          style: context.theme.body1.lightGreyText,
        )
      ],
    );
  }
}
