import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_bar_type.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/custom_app_bar.dart';

class MyQRCode extends StatelessWidget {
  const MyQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomAppBar(
          appBarType: AppBarType.regular,
      leadingIcon: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Assets.media.icons.chevronLeft.svg()),
      title: Text(
        "balance.tokenBalance".tr(),
        style: context.theme.headline4,
      ),
    ));
  }
}
