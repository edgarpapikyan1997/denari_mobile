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

import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/brand_item/brand_item_widget.dart';

class StoreListScreen extends StatefulWidget {

  const StoreListScreen({super.key,});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  final ShopsState _shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  final LoadingState _loadingState = LoadingState();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    _loadingState.startLoading();
    await _shopsState.getAllShops();
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
                      child: ListView.builder(
                        itemCount: _shopsState.shops.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BrandItemWidget(
                            isCheckBoxSelected:
                                _shopsState.checkBoxValues[index],
                            topPadding: index == 0 ? 32 : 16,
                            bottomPadding: 16,
                            brandName: _shopsState.shops[index].name,
                            avatar: _shopsState.shops[index].imageUrl,
                            tealButton: Checkbox(
                              side: WidgetStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                  width: 2.0,
                                  color:
                                      _shopsState.checkBoxValues[index] == true
                                          ? AppColors.black
                                          : AppColors.greyLight,
                                ),
                              ),
                              value: _shopsState.checkBoxValues[index],
                              shape: const CircleBorder(),
                              activeColor: Colors.black,
                              onChanged: (bool? value) {
                                setState(() {
                                  _shopsState.updateCheckBox(index: index, isAddress: false);
                                });
                              },
                            ),
                          );
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
