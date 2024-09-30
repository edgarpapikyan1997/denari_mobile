import 'package:denari_app/store/filters/switcher_state/switcher_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../utils/themes/app_colors.dart';

class SwitcherWidget extends StatelessWidget {
  final SwitcherState switcherState;
  final VoidCallback onTap;

  const SwitcherWidget(
      {super.key, required this.switcherState, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox(
        height: 22,
        width: 38,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Switch(
              thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(Icons.circle, color: Colors.white);
                  }
                  return const Icon(Icons.circle, color: Colors.white);
                },
              ),
              inactiveThumbColor: AppColors.white,
              activeTrackColor: AppColors.yellowDark,
              inactiveTrackColor: AppColors.borderColor,
              value: switcherState.switchEnable,
              onChanged: (value) {
                switcherState.updateSwitcher();
                onTap();
              }),
        ),
      );
    });
  }
}
