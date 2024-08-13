import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

class StoreItemInfo extends StatefulWidget {
  final String? brand;
  final String? name;
  final String? rating;
  final String? phone;
  final String? city;
  final String? dateTime;

  const StoreItemInfo(
      {super.key,
      this.brand,
      this.name,
      this.rating,
      this.phone,
      this.city,
      this.dateTime});

  @override
  State<StoreItemInfo> createState() => _StoreItemInfoState();
}

class _StoreItemInfoState extends State<StoreItemInfo> {
  String brand = Assets.media.images.toyStory.path;
  String name = 'Store Name';
  String rating = "4.5";
  String phone = '+1 (123) 456-7890';
  String city = '123 Main St, City';
  String dateTime = 'Daily from 10:00 to 20:00';

  Row showItemInfo(
      {required SvgPicture svgPicture, required String textValue}) {
    return Row(
      children: [
        svgPicture,
        const Delimiter(8),
        Text(textValue, style: context.theme.body1),
      ],
    );
  }

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
              Text("$rating/", style: context.theme.body1.black),
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
          ),
          const Delimiter(12),
          showItemInfo(
            svgPicture: Assets.media.icons.clock.svg(),
            textValue: dateTime,
          ),
        ],
      ),
    );
  }
}
