import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/view/screens/store_field_screen/widgets/store_item_info_creater.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';

class StoreItemInfo extends StatefulWidget {
  final String storeName;
  final String storeImage;

  final List<StoreItemInfoCreator> items;

  const StoreItemInfo({
    super.key,
    required this.storeImage,
    required this.storeName,
    required this.items,
  });

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.storeImage,
                  height: 56,
                  width: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const Delimiter(8),
              Text(
               widget.storeName,
                style: context.theme.headline5.bold,
              ),
              const Spacer(),
              Assets.media.icons.rateIcon.svg(),
              const Delimiter(4),
              Text("$rating/", style: context.theme.body1.black),
              Text('5', style: context.theme.body1.lightGreyText),
            ],
          ),
          ...widget.items.map((item) => item),
        ],
      ),
    );
  }
}
