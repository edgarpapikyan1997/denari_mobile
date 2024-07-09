import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../utils/themes/app_colors.dart';
import '../widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 104),
        child: CustomAppBar(
          leadingIcon: Assets.media.icons.token.svg(),
          tokenCount: '400', // should be changed to data from backEnd
          tealIcon: Assets.media.icons.search.svg(),
        ),),
      body: Container(
        color: Colors.teal.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.yellowDark,
            )
          ],
        ),
      ),
    );
  }
}
