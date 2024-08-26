import 'package:denari_app/store/rate_app_state/rate_app_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../store/custom_button_state/custom_button_state.dart';
import '../../../../utils/padding_utility/padding_utility.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../balance_widget.dart';
import '../../custom_button.dart';
import '../../rate_widget/rate_widget.dart';
import '../bottom_sheet_upper_piece.dart';

class CongratsMood extends StatefulWidget {
  final String? asset;
  final String? title;
  final String? tokens;
  final String? balance;

  const CongratsMood(
      {super.key,
      required this.asset,
      this.title,
      required this.tokens,
      this.balance});

  @override
  State<CongratsMood> createState() => _CongratsMoodState();
}

class _CongratsMoodState extends State<CongratsMood> {
  final RateAppState rateAppState = GetIt.I<RateAppState>();
  final CustomButtonState customButtonState = CustomButtonState();
  late final int? balance = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetUpperPiece(),
          PaddingUtility.only(
            top: 36,
            bottom: 24,
            child: widget.asset == null || widget.asset!.isNotEmpty
                ? Image.asset(widget.asset!)
                : const SizedBox(),
          ),
          PaddingUtility.only(
            left: 35,
            right: 35,
            bottom: 16,
            child: Text(
              widget.title!,
              style: context.theme.headline2.bold,
              textAlign: TextAlign.center,
            ),
          ),
          widget.tokens == null || widget.tokens!.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.searchBarColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IntrinsicWidth(
                    child: BalanceWidget(
                      balance: balance!,
                      textStyle: context.theme.headline4.medium,
                      isTokenBalance: true,
                      tokenIconWidth: 13,
                      tokenIconHeight: 14,
                      addPlusChar: true,
                      title: 'tokens',
                    ),
                  ),
                )
              : const SizedBox(),
          PaddingUtility.only(
            left: 35,
            right: 35,
            bottom: 64,
            child: Text(
              "${'bottomSheet.yourPurchase'.tr()}${widget.balance} ${"bottomSheet.at".tr()} [User Name] ${"bottomSheet.earnedYou".tr()} ${widget.tokens} ${'balance.tokens'.tr()}",
              style: context.theme.headline4.regular.lightGreyText,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'bottomSheet.wouldYouRate'.tr(),
            style: context.theme.headline4.regular,
          ),
          PaddingUtility.only(
            top: 16,
            bottom: 64,
            child: RateWidget(
              customButtonState: customButtonState,
            ),
          ),
          PaddingUtility.only(
            bottom: 16,
            child: Observer(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomButton(
                    title: 'Close',
                    isEnabled: true,
                    isWhite: true,
                    onTap: () {
                      context.pop();
                      Future.delayed(const Duration(seconds: 1))
                          .then((value) => rateAppState.setIndex(0));
                    },
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomButton(
                      title: 'Submit',
                      isEnabled: customButtonState.isButtonEnabled,
                      isWhite: false,
                      onTap: () {
                        context.pop();
                        context.pop();
                        context.pop();
                      },
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
