import 'package:denari_app/store/filters/range_state/range_configurator_state.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'range_field.dart';

class RangeConfigurator extends StatefulWidget {
  final String configuratorLabel;
  final RangeConfiguratorState rangeConfiguratorState;

  const RangeConfigurator({
    super.key,
    required this.configuratorLabel,
    required this.rangeConfiguratorState,
  });

  @override
  State<RangeConfigurator> createState() => _RangeConfiguratorState();
}

class _RangeConfiguratorState extends State<RangeConfigurator> {
  late final double valueFrom;
  late final double valueTo;

  @override
  void initState() {
    super.initState();
    valueFrom = widget.rangeConfiguratorState.rangeFrom.toDouble();
    valueTo = widget.rangeConfiguratorState.rangeTo.toDouble();

    // widget.rangeConfiguratorState.configure(
    //   widget.rangeConfiguratorState.rangeFrom,
    //   widget.rangeConfiguratorState.rangeTo,
    // );
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
                  fromDestination: widget.rangeConfiguratorState.rangeFrom,
                  label: widget.configuratorLabel,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RangeField(
                  fromDestination: widget.rangeConfiguratorState.rangeTo,
                  label: widget.configuratorLabel,
                ),
              ),
            ],
          ),
          const Delimiter(16),
          RangeSlider(
            values: RangeValues(
                widget.rangeConfiguratorState.rangeFrom.toDouble(),
                widget.rangeConfiguratorState.rangeTo.toDouble()),
            min: valueFrom,
            max: valueTo,
            onChanged: (RangeValues values) {
              widget.rangeConfiguratorState.configure(
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
