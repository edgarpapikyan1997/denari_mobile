import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../../data/shops/shop_branch_model/shop_branch_model.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/brand_item/brand_item_widget.dart';

class BranchListScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? chosenItems;

  const BranchListScreen({
    super.key,
    required this.chosenItems,
  });

  @override
  State<BranchListScreen> createState() => _BranchListScreenState();
}

class _BranchListScreenState extends State<BranchListScreen> {
  List<Map<String, dynamic>> chosenItems = [];
  final ShopsState _shopsState =
  ShopsState(shopsRepository: di.get<ImplShopsRepository>());
  final LoadingState _loadingState = LoadingState();
  List<BrandItemWidget> itemsByBranch = [];

  @override
  void initState() {
    super.initState();
    if (widget.chosenItems != null) {
      chosenItems = widget.chosenItems!;
    }
    initPrefs();
  }

  void initPrefs() async {
    _loadingState.startLoading();
    await _shopsState.getShopByIDtoList(
      items: chosenItems,
    );
    _loadingState.stopLoading();

    // Generate branch list after data is fetched
    generateBranchList();
  }

  void generateBranchList() {
    // Clear the list before generating new items
    itemsByBranch.clear();

    // Loop through each shop and its branches to create the BrandItemWidget list
    for (int shopIndex = 0;
    shopIndex < _shopsState.shopsUnitModelList.length;
    ++shopIndex) {
      for (var branchIndex = 0;
      branchIndex < _shopsState.shopsUnitModelList[shopIndex].branch.length;
      ++branchIndex) {
        itemsByBranch.add(
          BrandItemWidget(
            isCheckBoxSelected: _shopsState.addressCheckBoxValues[shopIndex],
            topPadding: shopIndex == 0 ? 32 : 16,
            bottomPadding: 16,
            brandName: _shopsState.shopsUnitModelList[shopIndex].name,
            secondaryInfo: Text(
              "${_shopsState.shopsUnitModelList[shopIndex].branch[branchIndex].street} - ${_shopsState.shopsUnitModelList[shopIndex].branch[branchIndex].city}",
              style: context.theme.body3.lightGreyText,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 3,
            ),
            avatar: _shopsState.shopsUnitModelList[shopIndex].imageUrl,
            tealButton: Checkbox(
              side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(
                  width: 2.0,
                  color: _shopsState.addressCheckBoxValues[shopIndex] == true
                      ? AppColors.black
                      : AppColors.greyLight,
                ),
              ),
              value: _shopsState.addressCheckBoxValues[shopIndex],
              shape: const CircleBorder(),
              activeColor: Colors.black,
              onChanged: (bool? value) {
                setState(() {
                  _shopsState.updateCheckBox(index: shopIndex, isAddress: true);
                });
              },
            ),
          ),
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          leadingIcon: InkWell(
            onTap: () {
              _shopsState.checkBoxReset();
              context.pop();
            },
            child: Assets.media.icons.chevronLeft.svg(),
          ),
          title: Text(
            'transaction.stores'.tr(),
            style: context.theme.headline4,
          ),
          tealIcon: InkWell(
            onTap: () {},
            child: Assets.media.icons.search.svg(),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return PaddingUtility.only(
          left: 16,
          right: 16,
          bottom: 50,
          child: Column(
            children: [
              PreviewBanner(
                leadingBanner: 'transaction.selectFromList'.tr(),
              ),
              _loadingState.isLoading == true
                  ? const Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: itemsByBranch.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemsByBranch[index];
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        isEnabled: true,
                        isWhite: true,
                        title: 'shops.reset'.tr(),
                        onTap: () {
                          _shopsState.checkBoxReset();
                        }),
                  ),
                  const Delimiter(8),
                  Expanded(
                    child: CustomButton(
                        isEnabled: _shopsState.isAnyCheckBoxSelected,
                        isWhite: false,
                        title: 'main.apply'.tr(),
                        onTap: () {
                          context.pop(_shopsState.checkedStoreItems);
                        }),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
/*
     BrandItemWidget(
                            isCheckBoxSelected:
                                _shopsState.addressCheckBoxValues[index],
                            topPadding: index == 0 ? 32 : 16,
                            bottomPadding: 16,
                            brandName:
                                _shopsState.shopsUnitModelList[index].name,
                            secondaryInfo: Text(
                              showAddresses(
                                  branches: _shopsState
                                      .shopsUnitModelList[index].branch),
                              style: context.theme.body3.lightGreyText,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 3,
                            ),
                            avatar:
                                _shopsState.shopsUnitModelList[index].imageUrl,
                            tealButton: Checkbox(
                              side: WidgetStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                  width: 2.0,
                                  color: _shopsState
                                              .addressCheckBoxValues[index] ==
                                          true
                                      ? AppColors.black
                                      : AppColors.greyLight,
                                ),
                              ),
                              value: _shopsState.addressCheckBoxValues[index],
                              shape: const CircleBorder(),
                              activeColor: Colors.black,
                              onChanged: (bool? value) {
                                setState(() {
                                  _shopsState.updateCheckBox(
                                      index: index, isAddress: true);
                                });
                              },
                            ),
                          );
 */
