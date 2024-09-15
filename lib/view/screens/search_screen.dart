import 'package:denari_app/data/transactions/model/transaction_receive_model.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_sizes/app_sizes.dart';
import '../../gen/assets.gen.dart';
import '../../store/search_field_state/search_field_state.dart';
import '../../utils/padding_utility/padding_utility.dart';
import '../../utils/themes/app_colors.dart';
import '../widgets/balance_widget.dart';
import '../widgets/bottom_sheet/item_info.dart';
import '../widgets/bottom_sheet/item_info_bottom_sheet.dart';
import '../widgets/brand_item/brand_item_widget.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/no_data_widget.dart';
import '../widgets/status_widget/status_widget.dart';

class SearchScreen extends StatefulWidget {
  final List<dynamic>? items;

  const SearchScreen({
    super.key,
    this.items,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final SearchFieldState searchState = SearchFieldState();
  final ScrollController _scrollController = ScrollController();

  List<String> searchList = [];

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
          leadingIcon: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Assets.media.icons.chevronLeft.svg(),
          ),
          title: Text(
            "main.search".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: PaddingUtility.symmetric(
        horizontal: 16,
        vertical: 16,
        child: Observer(builder: (context) {
          return Column(
            children: [
              TextField(
                onTap: () {
                  searchState.showCancel = true;
                  searchState.showSuggestion = true;
                },
                onChanged: (value) {
                  searchState.showSuggestion = true;
                  searchState.filterSuggestions(value, widget.items!);
                },
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                controller: _textEditingController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: PaddingUtility.only(
                    left: 12,
                    right: 8,
                    child: Assets.media.icons.search.svg(height: 24, width: 24),
                  ),
                  prefixIconConstraints:
                  const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                  suffixIcon: PaddingUtility.only(
                      right: 12,
                      child: searchState.showCancel
                          ? GestureDetector(
                        onTap: () {
                          _textEditingController.clear();
                          searchState.showCancel = false;
                          searchState.showSuggestion = false;
                          searchState.filteredSuggestions.clear();
                        },
                        child: Assets.media.icons.sloseCenter.svg(),
                      )
                          : const SizedBox()),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                  fillColor: AppColors.searchBarColor,
                  filled: true,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              if (searchState.filteredSuggestions.isEmpty &&
                  _textEditingController.text != '')
                Expanded(
                  child: NoDataWidget(
                    title: 'main.nothingFound'.tr(),
                    asset: Assets.media.images.taskListClock.image(),
                    description: 'main.trySearchAgain'.tr(),
                  ),
                ),
              if (searchState.showSuggestion && searchState.filteredSuggestions.isNotEmpty)
                Expanded(
                  child: PaddingUtility.symmetric(
                    horizontal: 16,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: searchState.filteredSuggestions.length,
                      itemBuilder: (context, index) {
                        final item = searchState.filteredSuggestions[index];
                        final DateTime? currentDate = DateTime.parse(item.date);
                        final DateTime? previousDate = index > 0
                            ? DateTime.parse(searchState.filteredSuggestions[index - 1].date)
                            : null;
                        bool showDateHeader = previousDate == null ||
                            currentDate?.day != previousDate.day;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BrandItemWidget(
                              topPadding: 16,
                              bottomPadding: 16,
                              addDivider: showDateHeader ? true : false,
                              secondaryInfo: StatusWidget(status: item.status),
                              avatar: item.shop.imageUrl,
                              brandName: item.shop.name,
                              addPlus: false,
                              balanceLD: item.transactionsAmount,
                              tokenBalance: item.tokenAddedAmount,
                              purchaseDate: currentDate,
                              balanceWidgets: [
                                BalanceWidget(
                                  isTokenBalance: false,
                                  tokenIconHeight: 20,
                                  tokenIconWidth: 18,
                                  horizontalPadding: 12,
                                  verticalPadding: 6,
                                  balance: item.amountGiftCardsUsing!,
                                  textStyle: context.theme.headline4,
                                ),
                                BalanceWidget(
                                  isTokenBalance: true,
                                  tokenIconHeight: 20,
                                  tokenIconWidth: 18,
                                  horizontalPadding: 12,
                                  verticalPadding: 6,
                                  balance: item.amountTokensUsed!,
                                  textStyle: context.theme.headline4,
                                  color: AppColors.whiteGrey,
                                ),
                              ],
                              onTap: () {
                                showItemInfoBottomSheet(
                                  addButtons: false,
                                  context: context,
                                  addCloseButton: true,
                                  image: item.shop.imageUrl,
                                  itemTitle: item.shop.name,
                                  dateTime: DateFormat('MMMM d, y, HH:mm')
                                      .format(currentDate!),
                                  itemInfoCost: "${item.amountGiftCardsUsing}",
                                  tokenBalance: BalanceWidget(
                                    color: AppColors.whiteGrey,
                                    verticalPadding: 5,
                                    horizontalPadding: 12,
                                    addPlusChar: true,
                                    title: 'balance.tokens'.tr(),
                                    isTokenBalance: true,
                                    tokenIconWidth: 13,
                                    tokenIconHeight: 14,
                                    balance: item.amountTokensUsed!,
                                  ),
                                  itemInfo: ItemInfo(
                                    id: item.id,
                                    status: StatusWidget(status: item.status),
                                    storeAddress:
                                    '${item.address?.street ?? ''} ${item.address?.city ?? ''}',
                                    commentByStore: item.comment,
                                    transactionAmount: item.transactionsAmount,
                                    tokensAddedAmount: item.tokenAddedAmount,
                                    amountTokensUsed: item.amountTokensUsed,
                                    amountGiftCardsUsed: item.amountGiftCardsUsing,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: searchState.filteredSuggestions.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(
              //             searchState.filteredSuggestions[index].shop.name),
              //         onTap: () {
              //           _textEditingController.text =
              //               searchState.filteredSuggestions[index].shop.name;
              //           searchState.showSuggestion = false;
              //           searchState.showCancel = false;
              //           FocusScope.of(context).unfocus();
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          );
        }),
      ),
    );
  }
}
