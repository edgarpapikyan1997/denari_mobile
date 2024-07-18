import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/cupertino.dart';

import '../../../gen/assets.gen.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 5; ++i)
          PaddingUtility.only(
            right: 6,
            left: 6,
            child: Assets.media.images.star.image(),
          ),
      ],
    );
  }
}
