import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../store/filters/distance_state/distance_configurator_state.dart';
import 'km_field.dart';

class DistanceConfigurator extends StatefulWidget {
  final double rangeFrom;
  final double rangeTo;
  final String configuratorLabel;

  const DistanceConfigurator({
    super.key,
    required this.rangeFrom,
    required this.rangeTo,
    required this.configuratorLabel,
  });

  @override
  State<DistanceConfigurator> createState() => _DistanceConfiguratorState();
}

class _DistanceConfiguratorState extends State<DistanceConfigurator> {
  final DistanceConfiguratorState distanceConfiguratorState = DistanceConfiguratorState();

  @override
  void initState() {
    super.initState();
    distanceConfiguratorState.configure(
      widget.rangeFrom.toInt(),
      widget.rangeTo.toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RangeField(
                  fromDestination: distanceConfiguratorState.from,
                  label: widget.configuratorLabel,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RangeField(
                  fromDestination: distanceConfiguratorState.to,
                  label: widget.configuratorLabel,
                ),
              ),
            ],
          ),
          const Delimiter(16),
          RangeSlider(
            values: distanceConfiguratorState.currentRangeValues,
            max: widget.rangeTo,
            onChanged: (RangeValues values) {
              distanceConfiguratorState.configure(
                values.start.toInt(),
                values.end.toInt(),
              );
            },
          ),
        ],
      );
    });
  }
}
