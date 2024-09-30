import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/delimiter.dart';

class StoreItemInfoCreator extends StatelessWidget {
  final SvgPicture svgPicture;
  final String textValue;

  const StoreItemInfoCreator(
      {super.key, required this.svgPicture, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.only(
      top: 13,
      child: Row(
        children: [
          svgPicture,
          const Delimiter(8),
          Text(textValue, style: context.theme.body1),
        ],
      ),
    );
  }
}
