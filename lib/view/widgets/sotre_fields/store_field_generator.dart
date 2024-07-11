import 'package:denari_app/view/widgets/sotre_fields/store_field_widget.dart';
import 'package:flutter/material.dart';

class StoreFieldGenerator extends StatelessWidget {
  final List<Map<String, dynamic>> storeFieldList;

  const StoreFieldGenerator({
    super.key,
    required this.storeFieldList,
  });

  Widget createWidgetCollection() {
    return Row(
      children: storeFieldList.map((storeField) {
        var asset = storeField['asset'] as Widget;
        String title = storeField['title'] as String;
        String description = storeField['description'] as String;
        return StoreFieldWidget(
          asset: asset,
          title: title,
          description: description,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: createWidgetCollection(),
    );
  }
}
