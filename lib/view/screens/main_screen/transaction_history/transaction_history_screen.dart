import 'package:denari_app/constants/bottom_sheet_type.dart';
import 'package:denari_app/data/transactions/model/transaction_receive_model.dart';
import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
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
import '../../../../../gen/assets.gen.dart';
import '../../../../../store/categories_state/categories_state.dart';
import '../../../../../utils/themes/app_colors.dart';
import '../../../../constants/app_bar_type.dart';
import '../../../../constants/app_sizes/app_sizes.dart';
import '../../../../constants/categories.dart';
import '../../../../data/transactions/model/transaction_filter_model.dart';
import '../../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../../store/token_balance_state/token_balance_state.dart';
import '../../../../store/transactions/transactions_state.dart';
import '../../../../utils/di/config.dart';
import '../../../widgets/bottom_sheet/item_info_bottom_sheet.dart';
import '../../../widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../widgets/brand_item/brand_item_list.dart';
import '../../../widgets/category/category.dart';
import '../../../widgets/category/category_field_generator.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/no_data_widget.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  final LoadingState _loadingState = LoadingState();
  List<TransactionReceiveModel?> items = [];
  Color? statusColor;
  TextStyle? textStyleColor;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    _loadingState.startLoading();
    await _transactionsState.getTransactionsHistory();
    if (_transactionsState.transactionHistoryModels.isNotEmpty) {
      items = _transactionsState.transactionHistoryModels.reversed.toList();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    }
    _loadingState.stopLoading();
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    if (difference == 0) return "Today";
    if (difference == 1) return "Yesterday";
    return DateFormat('MMMM, dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
            tealIcon: _transactionsState.transactionHistoryModels.isNotEmpty ||
                    _transactionsState.getError == null
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.push(
                              '/searchScreen',
                              extra: items,
                            );
                          },
                          child: Assets.media.icons.search.svg()),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                          onTap: () async {
                            final result = await context.pushNamed(
                              'transactionsFilter',
                              pathParameters: {
                                'startDate': items.last!.date.toString(),
                                'endDate': items.first!.date.toString(),
                              },
                            );
                            if (result is TransactionFilterModel) {
                              _loadingState.startLoading();
                              _transactionsState.filterModel = result;
                              await _transactionsState.getTransactionsHistory(
                                  endDate:
                                      _transactionsState.filterModel?.endDate,
                                  startDate:
                                      _transactionsState.filterModel?.startDate,
                                  minAmount:
                                      _transactionsState.filterModel?.rangeFrom,
                                  maxAmount:
                                      _transactionsState.filterModel?.rangeTo,
                                  stores: _transactionsState
                                      .filterModel?.storeNames);
                              _loadingState.stopLoading();
                            }

                            print(_transactionsState.filterModel);
                            /*
                                await _transactionsState
                                          .getTransactionsHistory(
                                        stores: shopsState.checkedStoreItems
                                            .map((storeItem) =>
                                                storeItem.values.toString())
                                            .toList(),
                                        startDate: datePickerState.startDate,
                                        endDate: datePickerState.endDate,
                                      );
                              */
                          },
                          child: Assets.media.icons.filter.svg()),
                    ],
                  )
                : null,
          ),
        ),
        body: _loadingState.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : _transactionsState.transactionHistoryModels.isEmpty ||
                    _transactionsState.getError != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _transactionsState.getError != null
                          ? NoDataWidget(
                              asset: Assets.media.images.cogIcon.image(
                                height: 96,
                                width: 96,
                              ),
                              title: "transaction.transactionError".tr(),
                              description: "transaction.tryRestart".tr(),
                            )
                          : NoDataWidget(
                              asset: Assets.media.images.taskListClock.image(
                                height: 96,
                                width: 96,
                              ),
                              title: "transaction.noTransaction".tr(),
                              description:
                                  "transaction.noTransactionDescription".tr(),
                            ),
                      const SizedBox(),
                    ],
                  )
                : PaddingUtility.only(
                    left: 16,
                    right: 16,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        if (items.isNotEmpty) {
                          final item = items[index];
                          final DateTime? currentDate = item?.date.toDate();
                          final DateTime? previousDate = index > 0
                              ? items[index - 1]?.date.toDate()
                              : null;
                          bool showDateHeader = previousDate == null ||
                              currentDate?.day != previousDate.day;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (showDateHeader)
                                Text(
                                  formatDate(currentDate!),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              BrandItemWidget(
                                topPadding: 16,
                                bottomPadding: 32,
                                addDivider: showDateHeader ? true : false,
                                secondaryInfo:
                                    StatusWidget(status: item!.status),
                                avatar: item.shop.imageUrl,
                                brandName: item.shop.name,
                                addPlus: false,
                                balanceLD: item.transactionsAmount,
                                tokenBalance: item.tokenAddedAmount,
                                purchaseDate: item.date.toDate(),
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
                                        .format(item.date.toDate()!),
                                    itemInfoCost:
                                        "${item.amountGiftCardsUsing}",
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
                                      transactionAmount:
                                          item.transactionsAmount,
                                      tokensAddedAmount: item.tokenAddedAmount,
                                      amountTokensUsed: item.amountTokensUsed,
                                      amountGiftCardsUsed:
                                          item.amountGiftCardsUsing,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
      );
    });
  }
}
