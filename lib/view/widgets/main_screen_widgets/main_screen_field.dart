import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../../utils/themes/app_colors.dart';

class MainScreenField extends StatelessWidget {
  final Widget asset;
  final String title;

  const MainScreenField({super.key, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CircleAvatar(backgroundColor: AppColors.white, radius: 29, child: SizedBox(
            height: 32,
              width: 32,
              child: asset))
              .paddingOnly(bottom: 4),
          SizedBox(
              child: Text(
                title,
                style: context.theme.body3,
                textAlign: TextAlign.center,
                maxLines: 2,
              )),
        ],
      ),
    );
  }
}
