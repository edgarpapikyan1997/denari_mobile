import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_sizes/app_sizes.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/custom_app_bar.dart';

class StoreFieldItemScreen extends StatelessWidget {
  const StoreFieldItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppSizes.backGroundImagePrefSize,
          child: CustomAppBar(
            appBarColor: Colors.teal,
            leadingIcon: Container(
              color: Colors.teal,
              width: context.width,
              child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Assets.media.icons.chevronLeft.svg()),
            ),
          ),
        ),
      body: Container(
        height: 50,
        width: 50,
        color: Colors.red,
      ),
    );
  }
}
