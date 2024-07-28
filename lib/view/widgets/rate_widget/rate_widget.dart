import 'package:denari_app/store/custom_button_state/custom_button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:denari_app/store/rate_app_state/rate_app_state.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:get_it/get_it.dart';

import '../../../gen/assets.gen.dart';

class RateWidget extends StatelessWidget {
  final CustomButtonState customButtonState;
  final RateAppState rateAppState = GetIt.I<RateAppState>();

  RateWidget({super.key, required this.customButtonState});

  List<Widget> getStars(int index) {
    List<Widget> items = [];
    for (var i = 1; i < 6; ++i) {
      items.add(
        GestureDetector(
          onTap: () {
            rateAppState.setIndex(i);
            customButtonState.updateButton(true);
          },
          child: PaddingUtility.only(
            right: 6,
            left: 6,
            child: i <= index
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
        children: getStars(rateAppState.index),
      );
    });
  }
}
