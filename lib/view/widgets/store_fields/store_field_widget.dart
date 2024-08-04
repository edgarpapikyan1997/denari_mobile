import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';

class StoreFieldWidget extends StatelessWidget {
  final String? asset;
  final String? title;
  final String? description;
  final double height;
  final double width;

  const StoreFieldWidget(
      {super.key,
      required this.asset,
      required this.title,
      required this.description,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whiteGrey),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              /// must be some image of unavailable data
              asset ?? Assets.media.images.coffe.path,
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Add some spacing between the container and text
        Text(
          title ?? '',
          style: context.theme.headline4,
        ),
        Text(
          description ?? '',
          style: context.theme.body3.lightGreyText,
        )
      ],
    );
  }
}
