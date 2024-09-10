import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/constants/bottom_sheet_type.dart';
import 'package:denari_app/data/user_finder/repository/impl/user_finder_repository.dart';
import 'package:denari_app/store/custom_button_state/custom_button_state.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/store/user_finder_state/user_finder_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_bar_type.dart';
import '../../../data/transactions/model/send_to_contact/send_to_contact_model.dart';
import '../../../data/transactions/repositoriy/transactions_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/sending_amount_state/sending_amount_state.dart';
import '../../../store/transactions/transactions_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/fields/edit_field.dart';

class SendGiftCardScreen extends StatefulWidget {
  final BrandItemWidget? brandItemWidget;

  const SendGiftCardScreen({
    super.key,
    required this.brandItemWidget,
  });

  @override
  State<SendGiftCardScreen> createState() => _SendGiftCardScreenState();
}

class _SendGiftCardScreenState extends State<SendGiftCardScreen> {
  final LoadingState _loadingState = LoadingState();
  final TransactionsState _transactionsState = TransactionsState(
      transactionsRepository: di.get<TransactionsRepository>());
  final UserFinderState _userFinderState =
      UserFinderState(userFinderRepository: di.get<ImplUserFinderRepository>());
  final SendingAmountState sendingAmountState = SendingAmountState();
  final CustomButtonState buttonState = CustomButtonState();
  BrandItemWidget? brandItemWidget;
  TextEditingController amountController = TextEditingController();
  SendToUserModel? sendToUserModel;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    if (widget.brandItemWidget != null) {
      brandItemWidget = widget.brandItemWidget;
    }
    amountController.text = sendingAmountState.sendingAmount != 0
        ? sendingAmountState.sendingAmount.toString()
        : '';
    sendingAmountState.setCurrentBalance(
        valueFromBalance: brandItemWidget!.tokenBalance ?? 0);
  }

  Future<void> sendGiftToUser(BuildContext context) async {
    sendToUserModel = SendToUserModel(
      recipientIdentifier: sendingAmountState.sendingContactInfo,
      shopId: brandItemWidget!.shopId!,
      amount: sendingAmountState.sendingAmount,
    );
    await _transactionsState.sendAmountToUser(
        sendToUserModel!, brandItemWidget!.isToken);

    if (_transactionsState.isSuccessful == true) {
      customBottomSheet(
        context: context,
        type: BottomSheetType.sendingCongrats,
        title: 'main.userFound'.tr(),
        description: sendingAmountState.sendingContactInfo,
        isToken: brandItemWidget!.isToken,
        asset: brandItemWidget!.avatar,
        brandName: brandItemWidget!.brandName,
        sendingBalance: sendingAmountState.sendingAmount,
      );
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
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
            "giftCard.giftCartTokens".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return PaddingUtility.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 35,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'giftCard.selectAmount'.tr(),
                              style: context.theme.body1.lightGreyText,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          brandItemWidget!,
                          const SizedBox(
                            height: 32,
                          ),
                          PreviewBanner(
                            leadingBanner: 'giftCard.specifyAmount'.tr(),
                            previewStyle: context.theme.body4.semiBold,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          EditField(
                            controller: amountController,
                            hint: 'giftCard.amount'.tr(),
                            hintStyle: context.theme.body1.greyLight,
                            textStyle: context.theme.body1,
                            borderRadius: 12.0,
                            value: sendingAmountState.sendingAmount != 0
                                ? sendingAmountState.sendingAmount.toString()
                                : null,
                            onChanged: (value) {
                              int newValue = int.tryParse(value) ?? 0;
                              sendingAmountState.setSendingAmount(
                                  amount: newValue);
                              sendingAmountState.sendingAmount != 0 &&
                                      sendingAmountState.sendingAmount <=
                                          brandItemWidget!.tokenBalance!.toInt()
                                  ? buttonState.isButtonEnabled = true
                                  : buttonState.isButtonEnabled = false;
                            },
                            error: sendingAmountState.isError ||
                                    sendingAmountState.sendingAmount >
                                        brandItemWidget!.tokenBalance!.toInt()
                                ? 'Amount is higher than balance'
                                : null,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              for (var i = 2; i < 6; ++i)
                                BalanceWidget(
                                  isTokenBalance: brandItemWidget!.isToken,
                                  textStyle: context.theme.headline4.medium,
                                  tokenIconWidth: 13,
                                  tokenIconHeight: 14,
                                  balance: i * 10,
                                  horizontalPadding: 12,
                                  verticalPadding: 6,
                                  color: AppColors.whiteGrey,
                                  onTap: () {
                                    sendingAmountState.setSendingAmount(
                                        amount: i * 10);
                                    amountController.text = sendingAmountState
                                        .sendingAmount
                                        .toString();
                                  },
                                ),
                            ],
                          ),
                          const Delimiter(32),
                          PreviewBanner(
                            leadingBanner: 'giftCard.sendTo'.tr(),
                            previewStyle: context.theme.body4.semiBold,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          EditField(
                            onChanged: (value) {
                              sendingAmountState.setContactInfo(
                                  newContactInfo: value);
                              sendingAmountState
                                          .sendingContactInfo.isNotEmpty &&
                                      sendingAmountState
                                              .sendingContactInfo.length >=
                                          9
                                  ? buttonState.isButtonEnabled = true
                                  : buttonState.isButtonEnabled = false;
                            },
                            hint: 'giftCard.phoneOrEmail'.tr(),
                            hintStyle: context.theme.body1.greyLight,
                            textStyle: context.theme.body1,
                            borderRadius: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    isEnabled: buttonState.isButtonEnabled,
                    isWhite: false,
                    onTap: () async {
                      _loadingState.startLoading();
                      await _userFinderState
                          .findUser(sendingAmountState.sendingContactInfo);
                      amountController = TextEditingController();
                      if (_userFinderState.contactExist == true) {
                        await sendGiftToUser(context);
                      } else {
                        customBottomSheet(
                            context: context,
                            type: BottomSheetType.alert,
                            title: 'bottomSheet.userNotFound'.tr(),
                            description:
                                "Do you want to send a Gift card to this user?");
                      }
                      _loadingState.stopLoading();
                    },
                    title: 'sign.send'.tr(),
                  ),
                ],
              ),
              Positioned(
                  child: _loadingState.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox())
            ],
          ),
        );
      }),
    );
  }
}
