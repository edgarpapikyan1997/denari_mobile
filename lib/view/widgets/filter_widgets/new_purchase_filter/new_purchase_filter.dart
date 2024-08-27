import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/transactions/model/transaction_model.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/bottom_sheet_upper_piece.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/filter_widgets/new_purchase_filter/purchase_amount_configurator.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../constants/bottom_sheet_type.dart';
import '../../../../data/shops/shop_unit_model/shop_unit_model.dart';
import '../../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/filters/slider_state/slider_state.dart';
import '../../../../store/transactions/transactions_state.dart';
import '../../../../utils/di/config.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../screens/qr_generator_screen/qr_generator_screen.dart';
import '../../bottom_sheet/custom_bottom_sheet.dart';
import '../../bottom_sheet/variants/modal_sheet.dart';

class NewPurchaseFilter extends StatefulWidget {
  final ShopsUnitModel shopUnitModel;
  final ProfileModel profileModel;

  const NewPurchaseFilter({
    super.key,
    required this.shopUnitModel,
    required this.profileModel,
  });

  @override
  State<NewPurchaseFilter> createState() => _NewPurchaseFilterState();
}

class _NewPurchaseFilterState extends State<NewPurchaseFilter> {
  SliderState giftSliderState = SliderState();
  SliderState tokenSliderState = SliderState();
  LoadingState loadingState = LoadingState();
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  TransactionModel? _transactionModel;

  @override
  void initState() {
    super.initState();
    _transactionModel = TransactionModel(
      date: DateTime.now().toString(),
      shopId: widget.shopUnitModel.branch[0].shopId,
      status: 'status.onHold'.tr(),
      userId: widget.profileModel.id,
      giftCardAmount: giftSliderState.maxGift,
      amountGiftCardsUsing: giftSliderState.giftValue,
      tokenAddedAmount: giftSliderState.maxToken,
      amountTokensUsed: giftSliderState.tokenValue,
      transactionsAmount: giftSliderState.tokenValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.only(
      top: 8,
      bottom: 40,
      left: 16,
      right: 16,
      child: Observer(builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetUpperPiece(),
            const Delimiter(28),
            PreviewBanner(
              leadingBanner: 'shops.newPurchase'.tr(),
              bannerUnderText: 'shops.selectAmount'.tr(),
            ),
            const Delimiter(24),
            PurchaseAmountConfigurator(
              sliderState: giftSliderState,
              shopsUnitModel: widget.shopUnitModel,
              previewTitle: 'shops.redeemGift'.tr(),
              isToken: false,
            ),
            const Delimiter(24),
            PurchaseAmountConfigurator(
              sliderState: tokenSliderState,
              shopsUnitModel: widget.shopUnitModel,
              previewTitle: 'shops.redeemToken'.tr(),
              isToken: true,
            ),
            const Delimiter(24),
            CustomButton(
                isEnabled: true,
                isWhite: false,
                title: 'qr.generateQR'.tr(),
                onTap: () {
                  loadingState.startLoading();
                  _transactionsState.sendTransaction(_transactionModel!);
                  loadingState.stopLoading();
                  loadingState.isLoading == true
                      ? const CircularProgressIndicator()
                      : _transactionsState.isSuccessful == true
                          ? customBottomSheet(
                              context: context,
                              type: BottomSheetType.congrats,
                              title: 'bottomSheet.congratsEaredToken'.tr(),
                              asset: Assets.media.images.fireworks.path,
                              tokens: _transactionModel!.tokenAddedAmount
                                  .toString(),
                              balance: _transactionModel!.amountTokensUsed
                                  .toString(),
                            )
                          : SnackBarAction(
                              label: 'Something went wrong',
                              onPressed: () {},
                            );
                  showModalSheet(
                    context: context,
                    child: SizedBox(
                      width: context.width,
                      child: QrGeneratorScreen(
                        transactionModel: _transactionModel!,
                        transactionID: widget.profileModel.id,
                        onTap: () {
                          customBottomSheet(
                            context: context,
                            type: BottomSheetType.congrats,
                            title: 'bottomSheet.congratsEaredToken'.tr(),
                            asset: Assets.media.images.fireworks.path,
                            tokens:
                                _transactionModel!.amountTokensUsed.toString(),
                            balance:
                                _transactionModel!.tokenAddedAmount.toString(),
                          );
                        },
                      ),
                    ),
                  );
                })
          ],
        );
      }),
    );
  }
}
