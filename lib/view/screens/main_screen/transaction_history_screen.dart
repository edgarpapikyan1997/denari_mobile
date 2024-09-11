import 'package:denari_app/constants/bottom_sheet_type.dart';
import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/screens/send_gift_screen/gift_card_categories_widgets/item_selector_widget.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/bottom_sheet/item_info.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:denari_app/view/widgets/status_widget/status_widget.dart';
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
import '../../widgets/bottom_sheet/item_info_bottom_sheet.dart';
import '../../widgets/bottom_sheet/custom_bottom_sheet.dart';
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
  final List<BrandItemWidget> brandItems = [];
  Color? statusColor;
  TextStyle? textStyleColor;
  String? status = "cancelled";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        brandItems.addAll(getBrandItems(context: context));
      });
    });
  }

  List<BrandItemWidget> getBrandItems({required BuildContext context}) {
    List<BrandItemWidget> items = [];
    for (var i = 1; i < 20; ++i) {
      if (i % 3 == 1) {
        status = 'completed';
      } else if(i == 2 || i == 5){
        status = 'cancelled';

      }
      else {
        status = 'onHold';
      }
      items.add(BrandItemWidget(
        addPlus: true,
        avatar: Assets.media.images.toyStory.path,
        brandName: 'Toy Story',
        secondaryInfo: status != null ? StatusWidget(status: status!) : null,
        tokenBalanceStyle: context.theme.body2,
        balanceLD: 20 * i,
        tokenBalance: 100 * i,
        addDivider: true,
        tokenColor: AppColors.whiteGrey,
        iconHeight: 12,
        iconWidth: 10,
        purchaseDate: DateTime(2024, 8, i == 5 ? i + 1 : i),
        addPreviewBanner: true,

      ));
    }
    return items;
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) return "Today";
    if (difference == 1) return "Yesterday";
    return DateFormat('MMMM dd, yyyy').format(date);
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
      body: brandItems.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PaddingUtility.symmetric(
              horizontal: 16,
              child: ListView.builder(
                itemCount: brandItems.length,
                itemBuilder: (context, index) {
                  final item = brandItems[index];
                  final DateTime currentDate = item.purchaseDate!;
                  final previousDate =
                      index > 0 ? brandItems[index - 1].purchaseDate! : null;
                  bool showDateHeader = previousDate == null ||
                      currentDate.day != previousDate.day;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showDateHeader)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            formatDate(currentDate),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      BrandItemWidget(
                        avatar: item.avatar,
                        brandName: item.brandName,
                        addPlus: item.addPlus,
                        secondaryInfo: item.secondaryInfo,
                        tokenBalanceStyle: item.tokenBalanceStyle,
                        balanceLD: item.balanceLD,
                        tokenBalance: item.tokenBalance,
                        addDivider: item.addDivider,
                        tokenColor: item.tokenColor,
                        iconHeight: item.iconHeight,
                        iconWidth: item.iconWidth,
                        purchaseDate: item.purchaseDate,
                        onTap: () {
                          showItemInfoBottomSheet(
                            // height: context.height - 50,
                            context: context,
                            addCloseButton: true,
                            image: item.avatar,
                            itemTitle: item.brandName,
                            dateTime: DateFormat('MMMM d, y, HH:mm')
                                .format(item.purchaseDate!),
                            itemInfoCost: "${item.balanceLD}",
                            // tokenBalance: BalanceWidget(
                            //   color: AppColors.whiteGrey,
                            //   verticalPadding: 5,
                            //   horizontalPadding: 12,
                            //   addPlusChar: true,
                            //   title: 'balance.tokens'.tr(),
                            //   isTokenBalance: true,
                            //   tokenIconWidth: 13,
                            //   tokenIconHeight: 14,
                            //   balance: item.tokenBalance!,
                            // ),
                            // itemInfo: ItemInfo(
                            //   id: '12345678',
                            //   status: item.secondaryInfo as StatusWidget,
                            //   storeAddress:
                            //       'Ikea, 2 34th St - Bur Dubai - Al Fahidi - Dubai',
                            //   balanceLD: item.balanceLD,
                            //   tokenBalance: item.tokenBalance,
                            //   commentByStore: 'Awaiting confirmation of payment',
                            // ),
                            onConfirmSecond: () {  },
                            onConfirmFirst: () {  },
                            firstButtonTitle: 'No',
                            secondButtonTitle: 'Yes',
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
