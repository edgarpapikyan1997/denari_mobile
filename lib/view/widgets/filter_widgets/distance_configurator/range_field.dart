import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/themes/app_colors.dart';

class RangeField extends StatelessWidget {
  final int fromDestination;
  final String label;
  const RangeField({super.key, required this.fromDestination,
    required this.label,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8,),
        border: Border.all(color: AppColors.greyLight),
      ),
      child: PaddingUtility(
        all: 16,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$fromDestination $label',
            style: context.theme.body1,
          ),
        ),
      ),
    );
  }
}
