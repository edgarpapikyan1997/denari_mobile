import 'dart:async';
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
import '../../../../data/authentication/repository/auth_repository.dart';
import '../../../../data/profile/repository/profile_repository.dart';
import '../../../../data/shops/shop_unit_model/shop_unit_model.dart';
import '../../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/filters/slider_state/slider_state.dart';
import '../../../../store/profile/profile_state.dart';
import '../../../../store/shops/shops_state/shops_state.dart';
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
  LoadingState _loadingState = LoadingState();
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  TransactionModel? _transactionModel;

  @override
  void initState() {
    super.initState();
    _transactionModel = TransactionModel(
      id: null,
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
    print(_transactionModel);
  }

  Future<void> _handleTransaction(BuildContext context) async {
    _loadingState.startLoading();
    await _transactionsState.sendTransaction(_transactionModel!);
    _loadingState.stopLoading();
    print(_transactionModel?.id);
    if (_transactionsState.isSuccessful.isNotEmpty &&
        _transactionModel != null && _transactionModel?.id != null) {
      showModalSheet(
        context: context,
        child: SizedBox(
          width: context.width,
          child: QrGeneratorScreen(
            transactionModel: _transactionModel!,
            transactionID: _transactionModel!.id.toString() ,
            onTap: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong, try later'),
          duration: Duration(seconds: 3),
        ),
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
      child: Observer(
        builder: (_) {
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
              _loadingState.isLoading
                  ? const CircularProgressIndicator() // Show loader while loading
                  : CustomButton(
                      isEnabled: true,
                      isWhite: false,
                      title: 'qr.generateQR'.tr(),
                      onTap: () => _handleTransaction(
                          context), // Trigger transaction handling
                    ),
            ],
          );
        },
      ),
    );
  }
}

