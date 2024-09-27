import 'package:flutter/material.dart';
import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import '../../../../store/shops/shops_state/shops_state.dart';
import '../../../../utils/themes/app_colors.dart';

class BranchListScreenGenerator extends StatefulWidget {
  final ShopsUnitModel shopsUnitModel;
  final ShopsState shopsState;
  final int shopIndex;

  const BranchListScreenGenerator(
      {super.key,
      required this.shopsUnitModel,
      required this.shopsState,
      required this.shopIndex});

  @override
  State<BranchListScreenGenerator> createState() =>
      _BranchListScreenGeneratorState();
}

class _BranchListScreenGeneratorState extends State<BranchListScreenGenerator> {
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList =
        List<bool>.filled(widget.shopsUnitModel.branch.length, false);
  }

  void toggleSelection(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: widget.shopsUnitModel.branch.asMap().entries.map((entry) {
          int index = entry.key;
          var branch = entry.value;
          bool isSelected = isSelectedList[index];
          return BrandItemWidget(
            isCheckBoxSelected: isSelected,
            brandName: widget.shopsUnitModel.name,
            avatar: widget.shopsUnitModel.imageUrl,
            secondaryInfo: Text('${branch.street}, ${branch.city}'),
            topPadding: 16,
            bottomPadding: 16,
            tealButton: Checkbox(
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 2.0,
                  color: isSelected ? AppColors.black : AppColors.greyLight,
                ),
              ),
              value: isSelected,
              shape: const CircleBorder(),
              activeColor: Colors.black,
              onChanged: (bool? value) {
                widget.shopsState.updateCheckBox(index: widget.shopIndex, branchIndex: index, isAddress: true);
                toggleSelection(index);

              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
