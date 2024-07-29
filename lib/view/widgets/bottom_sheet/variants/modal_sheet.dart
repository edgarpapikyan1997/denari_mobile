import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/buttons/button_icon.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

import '../popover.dart';

Future<T?> showModalSheet<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: AppColors.white,
    useRootNavigator: true,
    builder: (context) => child,
  );
}

class ModalSheet extends StatelessWidget {
  final Widget child;
  final bool closeButton;

  const ModalSheet({super.key, required this.child, this.closeButton = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Popover(),
        if (closeButton)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ButtonIcon(
                svg: Assets.media.icons.sloseCenter.path,
                buttonColor: Colors.transparent,
                iconColor: AppColors.black,
                iconSize: 24,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
        Delimiter(MediaQuery.paddingOf(context).bottom),
      ],
    );
  }
}
