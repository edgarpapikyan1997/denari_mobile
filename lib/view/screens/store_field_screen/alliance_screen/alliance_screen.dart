import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_bar_type.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/brand_item/brand_item_list.dart';
import '../../../widgets/brand_item/brand_item_widget.dart';
import '../../../widgets/no_data_widget.dart';

class AllianceScreen extends StatefulWidget {
  final bool? isAlliance;

  const AllianceScreen({super.key, this.isAlliance});

  @override
  State<AllianceScreen> createState() => _AllianceScreenState();
}

class _AllianceScreenState extends State<AllianceScreen> {
  final LoadingState loadingState = LoadingState();
  final brandName = 'Disney Toy Store';
  final purchaseDate = 'July 24, 2024';
  final List<BrandItemWidget> brandItems = [];

  @override
  void initState() {
    super.initState();
    loadingState.startLoading();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var i = 0; i < 20; ++i) {
      brandItems.add(
        BrandItemWidget(
          avatar: Assets.media.images.skyteam.path,
          brandName: '$brandName$i',
          secondaryInfo: Text(
            'shops.allianceSec'.tr(),
            style: context.theme.body3,
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          tealButton: widget.isAlliance == true
              ? GestureDetector(
                  onTap: () {
                    context.push('/alliance',);
                  },
                  child: Assets.media.icons.chevronRight.svg(),
                )
              : null,
        ),
      );
    }
    loadingState.stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          appBarType: AppBarType.regular,
          leadingIcon: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Assets.media.icons.chevronLeft.svg(),
          ),
          title: Text(
            widget.isAlliance == true ? "shops.alliance".tr() : "shops.shops".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: loadingState.isLoading == false
          ? brandItems.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  width: context.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: BrandItemList(
                          brandItems: brandItems,
                          itemsToLoad: 10,
                        ),
                      ),
                    ],
                  ),
                )
              : NoDataWidget(
                  asset: Assets.media.images.creditCard1.image(
                    height: 96,
                    width: 96,
                  ),
                  title: "giftCard.noGiftCards".tr(),
                  description: "giftCard.chooseGiftCardInApp".tr(),
                )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
