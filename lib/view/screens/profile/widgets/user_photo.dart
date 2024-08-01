import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/buttons/button_icon.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 94,
      child: Stack(
        children: [
          ClipOval(
            child: ColoredBox(
              color: AppColors.greyLight,
              child: Center(
                child: Assets.media.icons.camera.svg(),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ButtonIcon(
              svg: Assets.media.icons.camera.path,
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
