import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/themes/app_colors.dart';

class BrandTokenWidget extends StatelessWidget {
  final String avatar;
  final String brandName;
  final String lastUpdate;
  final Widget tokenBalance;

  const BrandTokenWidget(
      {super.key,
      required this.avatar,
      required this.brandName,
      required this.lastUpdate,
      required this.tokenBalance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.greyLight,
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(brandName, style: context.theme.headline4.medium,),
            Text(lastUpdate),
          ],
        ),
        Spacer(),
        tokenBalance,
      ],
    );
  }
}
