import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class StoreItemInfo extends StatefulWidget {
  const StoreItemInfo({super.key});

  @override
  State<StoreItemInfo> createState() => _StoreItemInfoState();
}

class _StoreItemInfoState extends State<StoreItemInfo> {
  String brand = Assets.media.images.toyStory.path;
  String name = 'Store Name';
  String rating = "4.5";
  String phone = '+1 (123) 456-7890';
  String city = '123 Main St, City';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                brand,
                height: 56,
                width: 56,
                fit: BoxFit.cover,
              ),
              const Delimiter(8),
              Text(
                name,
                style: context.theme.headline5.bold,
              ),
              const Spacer(),
              Assets.media.icons.rateIcon.svg(),
              const Delimiter(4),
              Text("$rating/", style: context.theme.body1),
              Text('5', style: context.theme.body1.lightGreyText),
            ],
          ),
          const Delimiter(12),
          Row(
            children: [
              Assets.media.icons.phoneCall.svg(),
              const Delimiter(8),
              Text(phone, style: context.theme.body1),
            ],
          ),
          const Delimiter(12),
          Row(
            children: [
              Assets.media.icons.map.svg(),
              const Delimiter(8),
              Text(city, style: context.theme.body1),
            ],
          )
        ],
      ),
    );
  }
}
