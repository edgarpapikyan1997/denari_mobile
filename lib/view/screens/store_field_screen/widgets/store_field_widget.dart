import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/themes/app_colors.dart';

class StoreFieldWidget extends StatelessWidget {
  final String? asset;
  final String? title;
  final String? description;
  final double height;
  final double width;
  final bool excludeTitle;

  const StoreFieldWidget({
    super.key,
    this.asset,
    required this.title,
    required this.description,
    required this.height,
    required this.width,
    this.excludeTitle = false,
  });

  Widget showImage() {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.whiteGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              height: height,
              width: width,
              child: Assets.media.images.safetyWarningHeat.image(),
            );
          },
          asset ?? '',
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return excludeTitle
        ? showImage()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showImage(),
              const SizedBox(height: 8),
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
