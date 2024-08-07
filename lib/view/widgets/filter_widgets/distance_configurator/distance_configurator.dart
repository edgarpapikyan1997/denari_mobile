import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../store/filters/distance_state/distance_configurator_state.dart';
import 'km_field.dart';

class DistanceConfigurator extends StatefulWidget {
  const DistanceConfigurator({super.key});

  @override
  State<DistanceConfigurator> createState() => _DistanceConfiguratorState();
}

class _DistanceConfiguratorState extends State<DistanceConfigurator> {
  DistanceConfiguratorState distanceConfiguratorState =
      DistanceConfiguratorState();
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: KmField(
                fromDestination: distanceConfiguratorState.from,
              )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: KmField(
                fromDestination: distanceConfiguratorState.to,
              )),
            ],
          ),
          const Delimiter(16),
          RangeSlider(
            values: _currentRangeValues,
            max: 100,
            onChanged: (RangeValues values) {
              _currentRangeValues = values;
              distanceConfiguratorState.configure(
                  _currentRangeValues.start.toInt(),
                  _currentRangeValues.end.toInt());
            },
          ),
        ],
      );
    });
  }
}
