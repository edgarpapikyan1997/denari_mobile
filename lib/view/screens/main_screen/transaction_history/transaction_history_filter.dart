import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/data/transactions/model/transaction_filter_model.dart';
import 'package:denari_app/store/date_picker_state/date_picker_state.dart';
import 'package:denari_app/store/filters/range_state/range_configurator_state.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/store/shops/shops_state/shops_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_bar_type.dart';
import '../../../../constants/categories.dart';
import '../../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/categories_state/categories_state.dart';
import '../../../../store/transactions/transactions_state.dart';
import '../../../../utils/di/config.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../../widgets/bottom_sheet/variants/modal_sheet.dart';
import '../../../widgets/category/category.dart';
import '../../../widgets/category/category_field_generator.dart';
import '../../../widgets/data_picker/data_picker.dart';
import '../../../widgets/filter_widgets/distance_configurator/range_configurator.dart';

class TransactionHistoryFilter extends StatefulWidget {
  final String? startDate;
  final String? endDate;

  const TransactionHistoryFilter({
    super.key,
    this.startDate,
    this.endDate,
  });

  @override
  State<TransactionHistoryFilter> createState() =>
      _TransactionHistoryFilterState();
}

class _TransactionHistoryFilterState extends State<TransactionHistoryFilter> {
  final LoadingState _loadingState = LoadingState();
  final DatePickerState datePickerState = DatePickerState();
  final CategoriesState categoriesState = CategoriesState();
  final ShopsState shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  DateTime? minimumDate;
  final RangeConfiguratorState rangeConfiguratorState =
      RangeConfiguratorState();

  late final List<Category> categories;
  late final List<Category> timeRange;

  @override
  void initState() {
    super.initState();
    if (datePickerState.startDate == null && datePickerState.endDate == null) {
      datePickerState.startDate = widget.startDate?.toDate()!;
      minimumDate = datePickerState.startDate;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text('transaction.transactionError'.tr()),
        ),
      );
    }
    initPrefs();
  }

  Future<void> initPrefs() async {
    _loadingState.startLoading();
    timeRange = [
      Category(type: CategoryType.today, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.thisWeek, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.thisMonth, iconColor: categoriesState.itemColor),
    ];
    rangeConfiguratorState.configure(0, 10000);
    _loadingState.stopLoading();
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
            "shops.filters".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return PaddingUtility.only(
            left: 16,
            right: 16,
            bottom: 16,
            child: datePickerState.startDate != null
                ? SizedBox(
                    height: context.height,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          child: Column(
                            children: [
                              PreviewBanner(
                                leadingBanner: 'transaction.date'.tr(),
                                bannerUnderText:
                                    'transaction.selectOptions'.tr(),
                              ),
                              const Delimiter(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: DataPicker(
                                      sourceDate: datePickerState.startDate,
                                      onTap: () {
                                        showModalSheet(
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          child: PaddingUtility.only(
                                            bottom: 50,
                                            left: 16,
                                            right: 16,
                                            child: SizedBox(
                                              height: context.height / 2.2,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: CupertinoDatePicker(
                                                      maximumDate:
                                                          DateTime.now(),
                                                      minimumDate:
                                                          datePickerState
                                                              .startDate,
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .date,
                                                      initialDateTime:
                                                          datePickerState
                                                              .startDate,
                                                      onDateTimeChanged:
                                                          (DateTime value) {
                                                        datePickerState
                                                            .setStartDate(
                                                                value);
                                                        datePickerState
                                                            .endDate = null;
                                                      },
                                                    ),
                                                  ),
                                                  const Delimiter(32),
                                                  CustomButton(
                                                    isEnabled: true,
                                                    isWhite: false,
                                                    onTap: () async {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  300));
                                                      context.pop();
                                                    },
                                                    title: 'main.apply'.tr(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Delimiter(8),
                                  Expanded(
                                      child: DataPicker(
                                    sourceDate: datePickerState.endDate,
                                    onTap: () {
                                      showModalSheet(
                                        context: context,
                                        child: PaddingUtility.only(
                                          bottom: 50,
                                          left: 16,
                                          right: 16,
                                          child: SizedBox(
                                            height: context.height / 2.2,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: CupertinoDatePicker(
                                                    maximumDate: DateTime.now(),
                                                    minimumDate: datePickerState
                                                        .startDate,
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    initialDateTime:
                                                        datePickerState
                                                            .startDate,
                                                    onDateTimeChanged:
                                                        (DateTime value) {
                                                      if (value.isBefore(
                                                          DateTime.now())) ;
                                                      datePickerState
                                                          .setEndDate(value);
                                                    },
                                                  ),
                                                ),
                                                const Delimiter(32),
                                                CustomButton(
                                                  isEnabled: true,
                                                  isWhite: false,
                                                  onTap: () async {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 300));
                                                    context.pop();
                                                  },
                                                  title: 'main.apply'.tr(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                ],
                              ),
                              const Delimiter(16),
                              CategoryFieldGenerator(
                                isRow: true,
                                justSelector: true,
                                unselectedColor: AppColors.borderColor,
                                categories: timeRange,
                                categoriesState: categoriesState,
                                onTap: () {
                                  switch (categoriesState.categoryType) {
                                    case CategoryType.today:
                                      datePickerState.startDate =
                                          DateTime.now();
                                      datePickerState.endDate = DateTime.now();
                                      break;
                                    case CategoryType.thisWeek:
                                      DateTime now = DateTime.now();
                                      int currentDayOfWeek = now.weekday;
                                      int daysToSubtract =
                                          currentDayOfWeek - DateTime.monday;
                                      datePickerState.startDate = now.subtract(
                                          Duration(days: daysToSubtract));
                                      datePickerState.endDate = now;

                                      break;
                                    case CategoryType.thisMonth:
                                      DateTime now = DateTime.now();
                                      DateTime firstDayOfMonth =
                                          DateTime(now.year, now.month, 1);
                                      datePickerState.startDate =
                                          firstDayOfMonth;
                                      datePickerState.endDate = now;
                                      break;
                                    default:
                                      break;
                                  }
                                },
                              ),
                              const Delimiter(32),
                              PreviewBanner(
                                leadingBanner: 'transaction.amountRange'.tr(),
                                bannerUnderText: 'transaction.enterAmount'.tr(),
                              ),
                              const Delimiter(16),
                              RangeConfigurator(
                                configuratorLabel: 'LD',
                                rangeConfiguratorState: rangeConfiguratorState,
                              ),
                              const Delimiter(32),
                              PreviewBanner(
                                leadingBanner: 'transaction.stores'.tr(),
                                bannerUnderText:
                                    shopsState.checkedStoreItems.isNotEmpty
                                        ? shopsState.checkedStoreItems
                                            .map((item) => item.values.first)
                                            .join(', ')
                                        : 'transaction.notChosen'.tr(),
                                tealButton: GestureDetector(
                                  onTap: () async {
                                    shopsState.checkedStoreItems =
                                        await context.pushNamed(
                                      'storeListScreen',
                                    ) as List<Map<String, dynamic>>;
                                  },
                                  child: Assets.media.icons.chevronRight.svg(),
                                ),
                              ),
                              const Delimiter(32),
                              PreviewBanner(
                                leadingBanner: 'transaction.branch'.tr(),
                                previewStyle:
                                    shopsState.checkedStoreItems.isNotEmpty
                                        ? context.theme.headline2.bold
                                        : context
                                            .theme.headline2.bold.lightGreyText,
                                bannerUnderText:
                                    shopsState.checkedAddressItems.isNotEmpty
                                        ? shopsState.checkedAddressItems
                                            .map((item) => item.values.first)
                                            .join(', ')
                                        : 'transaction.notChosen'.tr(),
                                tealButton: GestureDetector(
                                  onTap: () async {
                                    if (shopsState
                                            .checkedStoreItems.isNotEmpty ==
                                        true) {
                                      shopsState.checkedAddressItems =
                                          (await context.pushNamed(
                                                  'branchListScreen',
                                                  extra: shopsState
                                                      .checkedStoreItems))
                                              as List<Map<String, dynamic>>;
                                    }
                                  },
                                  child: Assets.media.icons.chevronRight.svg(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PaddingUtility.only(
                          bottom: 36,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    isEnabled: true,
                                    isWhite: true,
                                    title: 'shops.reset'.tr(),
                                    onTap: () {
                                      categoriesState.unselectCategory();
                                      shopsState.checkBoxReset(
                                          isAddress: false);
                                      shopsState.checkBoxReset(isAddress: true);
                                      rangeConfiguratorState.resetRange();
                                      datePickerState.resetDate(
                                          widget.startDate, widget.endDate);
                                    }),
                              ),
                              const Delimiter(8),
                              Expanded(
                                child: CustomButton(
                                    isEnabled: true,
                                    isWhite: false,
                                    title: 'main.apply'.tr(),
                                    onTap: () async {
                                      _loadingState.startLoading();
                                      context.pop(TransactionFilterModel(
                                        rangeFrom:
                                            rangeConfiguratorState.rangeFrom,
                                        rangeTo: rangeConfiguratorState.rangeTo,
                                        startDate: datePickerState.startDate,
                                        endDate: datePickerState.endDate,
                                        storeNames: shopsState.checkedStoreItems
                                            .map((item) =>
                                                item.values.toString())
                                            .toList(),
                                      ));
                                      _loadingState.stopLoading();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox());
      }),
    );
  }
}
