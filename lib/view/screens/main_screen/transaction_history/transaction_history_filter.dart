import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/store/date_picker_state/date_picker_state.dart';
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
import 'package:mobx/mobx.dart';
import '../../../../constants/app_bar_type.dart';
import '../../../../constants/categories.dart';
import '../../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/categories_state/categories_state.dart';
import '../../../../utils/di/config.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../../widgets/bottom_sheet/variants/modal_sheet.dart';
import '../../../widgets/category/category.dart';
import '../../../widgets/category/category_field_generator.dart';
import '../../../widgets/data_picker/data_picker.dart';
import '../../../widgets/filter_widgets/distance_configurator/distance_configurator.dart';

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
  final ShopsState _shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  DateTime? minimumDate;
  late final List<Category> categories;
  late final List<Category> timeRange;
  List<String>? selectedShops;

  @override
  void initState() {
    super.initState();
    if (datePickerState.startDate == null && datePickerState.endDate == null) {
      datePickerState.startDate = widget.startDate?.toDate()!;
      minimumDate = datePickerState.startDate;
      // datePickerState.endDate = widget.endDate?.toDate()!;
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

  void initPrefs() {
    _loadingState.startLoading();

    timeRange = [
      Category(type: CategoryType.today, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.thisWeek, iconColor: categoriesState.itemColor),
      Category(
          type: CategoryType.thisMonth, iconColor: categoriesState.itemColor),
    ];
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
                ? Column(
                    children: [
                      PreviewBanner(
                        leadingBanner: 'transaction.date'.tr(),
                        bannerUnderText: 'transaction.selectOptions'.tr(),
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
                                              maximumDate: DateTime.now(),
                                              minimumDate: minimumDate,
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: minimumDate,
                                              onDateTimeChanged:
                                                  (DateTime value) {
                                                datePickerState
                                                    .setStartDate(value);
                                                datePickerState.endDate = null;
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
                                            minimumDate:
                                                datePickerState.startDate,
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime:
                                                datePickerState.startDate,
                                            onDateTimeChanged:
                                                (DateTime value) {
                                              if (value
                                                  .isBefore(DateTime.now())) ;
                                              datePickerState.setEndDate(value);
                                            },
                                          ),
                                        ),
                                        const Delimiter(32),
                                        CustomButton(
                                          isEnabled: true,
                                          isWhite: false,
                                          onTap: () async {
                                            await Future.delayed(const Duration(
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
                        onTap: () {},
                      ),
                      const Delimiter(32),
                      PreviewBanner(
                        leadingBanner: 'transaction.amountRange'.tr(),
                        bannerUnderText: 'transaction.enterAmount'.tr(),
                      ),
                      const Delimiter(16),
                      const DistanceConfigurator(
                        rangeFrom: 0,
                        rangeTo: 10000,
                        configuratorLabel: 'LD',
                      ),
                      const Delimiter(32),
                      PreviewBanner(
                        leadingBanner: 'transaction.stores'.tr(),
                        bannerUnderText:
                            _shopsState.checkedStoreNames.isNotEmpty
                                ? _shopsState.checkedStoreNames.join(', ')
                                : 'transaction.notChosen'.tr(),
                        tealButton: GestureDetector(
                          onTap: () async {
                            _shopsState.checkedStoreNames =
                                ObservableList<String>();
                            ObservableList<String>? result = await context.pushNamed(
                              'storeListScreen',
                              extra: false
                            );
                            if (result != null) {
                              _shopsState.checkedStoreNames = result;
                            } else {
                              _shopsState.checkBoxReset();
                            }
                          },
                          child: Assets.media.icons.chevronRight.svg(),
                        ),
                      ),
                      const Delimiter(32),
                      PreviewBanner(
                        leadingBanner: 'transaction.branch'.tr(),
                        previewStyle: _shopsState.checkedStoreNames.isNotEmpty
                            ? context.theme.headline2.bold
                            : context.theme.headline2.bold.lightGreyText,
                        bannerUnderText:
                            _shopsState.addressCheckBoxValues.isNotEmpty
                                ? _shopsState.checkedAddressNames.join(', ')
                                : 'transaction.notChosen'.tr(),
                        tealButton: GestureDetector(
                          onTap: () async {
                            if (_shopsState.checkedStoreNames.isNotEmpty) {
                              _shopsState.checkedAddressNames =
                                  ObservableList<String>();
                              ObservableList<String>? result =
                                  await context.pushNamed(
                                'storeListScreen',
                                extra: true
                              );
                              if (result != null) {
                                _shopsState.checkedStoreNames = result;
                              } else {
                                _shopsState.checkBoxReset();
                              }
                            }
                          },
                          child: Assets.media.icons.chevronRight.svg(),
                        ),
                      ),
                    ],
                  )
                : const SizedBox());
      }),
    );
  }
}
