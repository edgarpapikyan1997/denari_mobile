import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';

import '../../../gen/assets.gen.dart';
import '../../../store/rate_app_state/rate_app_state.dart';
import '../../../utils/services/get_it.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
  });

  List<Widget> getIndex(int index) {
    print(rateAppState.isSubmitEnabled);
    rateAppState.setIndex(index);
    List<Widget> items = [];
    for (var i = 1; i < 6; ++i) {
      items.add(
        GestureDetector(
          onTap: () {
            getIndex(i);
            rateAppState.setEnable();
          },
          child: PaddingUtility.only(
            right: 6,
            left: 6,
            child: index == 0
                ? Assets.media.images.star.image()
                : i <= rateAppState.index
                    ? Assets.media.images.ratedStar.image()
                    : Assets.media.images.star.image(),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getIndex(rateAppState.index),
      );
    });
  }
}
