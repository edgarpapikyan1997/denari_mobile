import 'package:denari_app/store/custom_button_state/custom_button_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/sending_amount_state/sending_amount_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/fields/edit_field.dart';

class SendGiftCardScreen extends StatefulWidget {
  final BrandItemWidget brandItemWidget;

  const SendGiftCardScreen({
    super.key,
    required this.brandItemWidget,
  });

  @override
  State<SendGiftCardScreen> createState() => _SendGiftCardScreenState();
}

class _SendGiftCardScreenState extends State<SendGiftCardScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController sendInformationController = TextEditingController();
  SendingAmountState sendingAmountState = SendingAmountState();
  CustomButtonState buttonState = CustomButtonState();

  @override
  void initState() {
    super.initState();
    sendingAmountState.setCurrentBalance(
        valueFromBalance: widget.brandItemWidget.tokenBalance ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 88),
        child: CustomAppBar(
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
        return PaddingUtility(
          all: 16,
          child: Column(
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
                      BrandItemWidget(
                        isToken: widget.brandItemWidget.isToken,
                        avatar: Assets.media.images.toyStory.path,
                        brandName: 'McDonalds',
                        tokenBalance: 50,
                        addDivider: false,
                        topPadding: 8,
                        bottomPadding: 8,
                        leftPadding: 12,
                        rightPadding: 12,
                        wrapperColor: AppColors.whiteGrey,
                      ),
                      // widget.brandItemWidget,
                      const SizedBox(
                        height: 32,
                      ),
                      PreviewBanner(
                        leadingBanner: Text(
                          'giftCard.specifyAmount'.tr(),
                          style: context.theme.body4.semiBold,
                        ),
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
                        onChanged: (value) {
                          int newValue = int.tryParse(value) ?? 0;
                          sendingAmountState.setSendingAmount(amount: newValue);
                          sendInformationController.text.isNotEmpty &&
                                  amountController.text.isNotEmpty
                              ? buttonState.isButtonEnabled = true
                              : buttonState.isButtonEnabled = false;
                        },
                        error: sendingAmountState.isError
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
                              isTokenBalance: widget.brandItemWidget.isToken,
                              textStyle: context.theme.headline4.medium,
                              balance: i * 10,
                              horizontalPadding: 12,
                              verticalPadding: 6,
                              color: AppColors.whiteGrey,
                              onTap: () {
                                sendingAmountState.setSendingAmount(amount: 20);
                                amountController.text =
                                    sendingAmountState.sendingAmount.toString();
                              },
                            ),
                        ],
                      ),
                      const Delimiter(32),
                      PreviewBanner(
                        leadingBanner: Text(
                          'giftCard.sendTo'.tr(),
                          style: context.theme.body4.semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      EditField(
                        onChanged: (value) {
                          sendInformationController.text.isNotEmpty &&
                                  amountController.text.isNotEmpty
                              ? buttonState.isButtonEnabled = true
                              : buttonState.isButtonEnabled = false;
                        },
                        hint: 'giftCard.phoneOrEmail'.tr(),
                        hintStyle: context.theme.body1.greyLight,
                        textStyle: context.theme.body1,
                        borderRadius: 12.0,
                        controller: sendInformationController,
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
                onTap: () {},
                title: 'sign.send'.tr(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
