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
import '../../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/loading_state/loading_state.dart';
import '../../../../store/shops/shops_state/shops_state.dart';
import '../../../../utils/di/config.dart';
import '../../../widgets/brand_item/brand_item_widget.dart';
import 'branch_list_screen_generator.dart';

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
    initPrefs();
  }

  void initPrefs() async {
    _loadingState.startLoading();
    if (widget.chosenItems != null) {
      _shopsState.chosenAddressItems = widget.chosenItems!;
    }
    await _shopsState.getShopByIDtoList(
      items: _shopsState.chosenAddressItems,
    );
    _loadingState.stopLoading();
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
                      child: Observer(builder: (_) {
                        return ListView.builder(
                          itemCount: _shopsState.shopsUnitModelList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BranchListScreenGenerator(
                              shopsUnitModel:
                              _shopsState.shopsUnitModelList[index],
                              shopsState: _shopsState,
                              shopIndex: index,
                            );
                          },
                        );
                      }),
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
                          context.pop(_shopsState.checkedAddressItems);
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
