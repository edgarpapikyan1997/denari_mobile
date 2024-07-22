import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final Widget asset;
  final String title;
  final String description;

  const NoDataWidget(
      {super.key,
      required this.asset,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          asset,
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: context.theme.headline2.bold,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width / 7),
            child: Text(
              description,
              style: context.theme.headline4.regular.lightGreyText,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
