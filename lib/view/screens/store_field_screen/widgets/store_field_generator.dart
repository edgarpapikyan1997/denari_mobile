import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'store_field_widget.dart';

class StoreFieldGenerator extends StatelessWidget {
  final double? height;
  final double? width;
  final List<Map<String, dynamic>> storeFieldList;
  final bool isGrid;
  final bool excludeTitle;

  const StoreFieldGenerator({
    super.key,
    this.storeFieldList = const [],
    required this.isGrid,
    this.height,
    this.width,
    this.excludeTitle = false,
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
          return GestureDetector(
            onTap: () {
              context.push(
                '/storeFieldItemScreen',
              );
            },
            child: StoreFieldWidget(
              asset: asset,
              title: title,
              description: description,
              width: width ?? 168,
              height: height ?? 175,
            ),
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
              width: width ?? 128,
              height: height ?? 148,
              excludeTitle: excludeTitle,
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
