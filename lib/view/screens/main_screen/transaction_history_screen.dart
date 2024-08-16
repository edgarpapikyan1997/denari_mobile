import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/screens/send_gift_screen/gift_card_categories_widgets/item_selector_widget.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/categories_state/categories_state.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../../constants/app_bar_type.dart';
import '../../../constants/app_sizes/app_sizes.dart';
import '../../../constants/categories.dart';
import '../../../store/token_balance_state/token_balance_state.dart';
import '../../widgets/bottom_sheet/Item_info_bottom_sheet.dart';
import '../../widgets/brand_item/brand_item_list.dart';
import '../../widgets/category/category.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final BrandItemSelectState sendGiftItemSelectState = BrandItemSelectState();
  final BrandItemSelectState tokenItemSelectState = BrandItemSelectState();
  final _tokenBalanceState = TokenBalanceState(tokenRepository: null);
  final List<BrandItemWidget> brandItems = [];
  final DateTime purchaseDate = DateTime(2024, 9, 15);
  String? status = "onHold";
  int? items = 15;
  bool isToken = false;
  Color? statusColor;
  TextStyle? textStyleColor;

  @override
  void initState() {
    super.initState();
  }

  List<BrandItemWidget> getBrandItems({required BuildContext context}) {
    List<BrandItemWidget> items = [];
    for (var i = 0; i < 20; ++i) {
      if (i == 3) {
        status = 'completed';
      }
      items.add(BrandItemWidget(
        addPlus: true,
        avatar: Assets.media.images.toyStory.path,
        brandName: 'Toy Story',
        secondaryInfo: status != null
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: status == 'onHold'
                      ? statusColor = AppColors.statusOnHold
                      : status == 'cancelled'
                          ? statusColor = AppColors.statusCancelled
                          : status == 'completed'
                              ? statusColor = AppColors.statusComplete
                              : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status ?? '',
                  style: status == 'onHold'
                      ? context.theme.body2.statusOnHold
                      : status == 'cancelled'
                          ? context.theme.body2.alertRed
                          : status == 'completed'
                              ? context.theme.body2.completed
                              : null,
                  softWrap: true,
                ),
              )
            : null,
        tokenBalanceStyle: context.theme.body2,
        balanceLD: 20,
        tokenBalance: 100,
        addDivider: true,
        tokenColor: AppColors.whiteGrey,
        iconHeight: 12,
        iconWidth: 10,
        purchaseDate: purchaseDate,
      ));
    }
    return items;
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
              child: Assets.media.icons.chevronLeft.svg()),
          title: Text(
            "transaction.transaction".tr(),
            style: context.theme.headline4,
          ),
          tealIcon: Row(
            children: [
              Assets.media.icons.search.svg(),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    context.push(
                      '/shopScreenFilter',
                    );
                  },
                  child: Assets.media.icons.filter.svg()),
            ],
          ),
        ),
      ),
      body: PaddingUtility.symmetric(
        horizontal: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BrandItemList(
                brandItems: getBrandItems(context: context),
                itemsToLoad: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
