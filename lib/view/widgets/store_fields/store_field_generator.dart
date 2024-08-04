import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/themes/app_colors.dart';
import 'store_field_widget.dart';

class StoreFieldGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> storeFieldList;
  final bool isGrid;

  const StoreFieldGenerator({
    super.key,
    this.storeFieldList = const [],
    required this.isGrid,
  });

  Widget showGrid(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: context.width / 2,
          mainAxisExtent: 240,
          crossAxisSpacing: 8,
        ),
        itemCount: storeFieldList.length,
        itemBuilder: (context, index) {
          var storeField = storeFieldList[index];
          String? asset = storeField['asset'] as String?;
          String title = storeField['title'] as String;
          String description = storeField['description'] as String;
          return StoreFieldWidget(
            asset: asset,
            title: title,
            description: description,
            width: 168,
            height: 175,
          );
        });
  }

  Widget showListView() {
    int itemCount = storeFieldList.length > 4 ? 4 : storeFieldList.length;
    return SizedBox(
      height: 196,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(itemCount, (index) {
          var storeField = storeFieldList[index];
          String? asset = storeField['asset'] as String?;
          String title = storeField['title'] as String;
          String description = storeField['description'] as String;
          return PaddingUtility.only(
            right: index != itemCount - 1 ? 8 : 0,
            child: StoreFieldWidget(
              asset: asset,
              title: title,
              description: description,
              width: 128,
              height: 148,
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      return isGrid ? showGrid(context) : showListView();
  }
}
