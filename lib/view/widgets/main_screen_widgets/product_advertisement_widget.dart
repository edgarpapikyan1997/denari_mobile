import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ProductAdvertisementWidget extends StatelessWidget {
  final double radius;
  final String? title;
  final ImageProvider? image;

  const ProductAdvertisementWidget(
      {super.key, required this.radius, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: AppColors.greyDark.withOpacity(0.2),
              blurRadius: 3,
              blurStyle: BlurStyle.normal,
              spreadRadius: 2.5,
              offset: const Offset(0, 3)),
        ],
        color: AppColors.greyLight.withOpacity(0.2),
        image: image != null
            ? DecorationImage(
          image: image!,
          fit: BoxFit.cover,
        )
            : null,
      ),
      height: 124,
      width: context.width,
    );
  }
}
