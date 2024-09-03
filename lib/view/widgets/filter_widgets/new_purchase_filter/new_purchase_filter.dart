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
import 'package:go_router/go_router.dart';
import '../../../../data/shops/shop_unit_model/shop_unit_model.dart';
import '../../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../../store/filters/slider_state/slider_state.dart';
import '../../../../store/transactions/transactions_state.dart';
import '../../../../utils/di/config.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../screens/qr/qr_generator_screen/qr_generator_screen.dart';
import '../../bottom_sheet/variants/modal_sheet.dart';

class NewPurchaseFilter extends StatefulWidget {
  final bool? isQRScanned;
  final ShopsUnitModel shopUnitModel;
  final ProfileModel profileModel;

  const NewPurchaseFilter({
    super.key,
    this.isQRScanned = false,
    required this.shopUnitModel,
    required this.profileModel,
  });

  @override
  State<NewPurchaseFilter> createState() => _NewPurchaseFilterState();
}

class _NewPurchaseFilterState extends State<NewPurchaseFilter> {
  final SliderState sliderState = SliderState();
  LoadingState loadingState = LoadingState();
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  TransactionModel? _transactionModel;
  String transactionID = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> sendTransaction(BuildContext context) async {
    _transactionModel = TransactionModel(
      addressShopId: 12,
      date: DateTime.now().toString(),
      shopId: widget.shopUnitModel.branch[0].shopId,
      status: 'status.onHold'.tr(),
      giftCardAmount: 0,
      amountGiftCardsUsing: sliderState.giftValue,
      tokenAddedAmount: sliderState.tokenValue,
      amountTokensUsed: sliderState.tokenValue,
      transactionsAmount: sliderState.transactionAmount,
    );
    await _transactionsState.sendTransaction(_transactionModel!);
    if (!mounted) return;
    if (_transactionsState.transactionReceiveModel != null) {
      loadingState.stopLoading();
      showModalSheet(
        context: context,
        child: SizedBox(
          width: context.width,
          child: QrGeneratorScreen(
            transactionID: _transactionsState.transactionReceiveModel!.id!,
            onTap: () {
              context.pop();
            },
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 3),
            content: Text('transaction.transactionSent'.tr())),
      );
    } else {
      loadingState.stopLoading();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 3),
            content: Text('transaction.transactionIDError'.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.only(
      top: 8,
      bottom: 40,
      left: 16,
      right: 16,
      child: Observer(builder: (_) {
        print("is qr scanned >>> ${widget.isQRScanned}");
        return Stack(
          children: [
            Column(
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
                  isQRScanned: widget.isQRScanned ?? false,
                  sliderState: sliderState,
                  shopsUnitModel: widget.shopUnitModel,
                  previewTitle: 'shops.redeemGift'.tr(),
                  isToken: widget.isQRScanned == true ? true : false,
                ),
                const Delimiter(24),
                PurchaseAmountConfigurator(
                  isQRScanned: widget.isQRScanned ?? false,
                  sliderState: sliderState,
                  shopsUnitModel: widget.shopUnitModel,
                  previewTitle: 'shops.redeemToken'.tr(),
                  isToken:  widget.isQRScanned == true ? false : true,
                ),
                const Delimiter(24),
                CustomButton(
                    isEnabled: true,
                    isWhite: false,
                    title: 'qr.generateQR'.tr(),
                    onTap: () async {
                      sliderState.changeGiftCardLDValue(sliderState.giftValue);
                      sliderState.changeTokenValue(sliderState.tokenValue);
                      loadingState.startLoading();
                      await sendTransaction(context);
                    }),
              ],
            ),
            if (loadingState.isLoading == true)
              const Positioned(
                bottom: 220,
                left: 0,
                right: 0,
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        );
      }),
    );
  }
}
