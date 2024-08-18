import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../custom_button.dart';
import 'bottom_sheet_upper_piece.dart';
import 'item_info.dart';

void showItemInfoBottomSheet({
  required BuildContext context,
  VoidCallback? onConfirmSecond,
  VoidCallback? onConfirmFirst,
  String? firstButtonTitle,
  String? secondButtonTitle,
  required String itemTitle,
  bool addButtons = false,
  bool addCloseButton = false,
  Text? underInfoCostText,
  bool itemTitleChevronRight = false,
  String? dateTime,
  String? image,
  String? itemInfoCost = '0',
  BalanceWidget? tokenBalance,
  ItemInfo? itemInfo,
  double? height,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: context.width,
          height: height,
          padding: const EdgeInsets.only(top: 8, bottom: 44, left: 16, right: 16),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PaddingUtility.only(
                  bottom: addCloseButton == false ? 16 : 0,
                  child: const BottomSheetUpperPiece()),
              addCloseButton
                  ? Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Assets.media.icons.sloseCenter.svg()),
              )
                  : const SizedBox(),
              dateTime != null
                  ? Text(
                dateTime,
                style: context.theme.body3.lightGreyText,
              ).paddingOnly(
                bottom: 16,
              )
                  : const SizedBox(),
              image != null
                  ? Image.asset(
                      image,
                      height: 76,
                      width: 76,
                      fit: BoxFit.contain,
                    ).paddingOnly(bottom: 8)
                  : const SizedBox(),
              itemTitleChevronRight
                  ? GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemTitle,
                            style: context.theme.body4.medium,
                          ),
                          Assets.media.icons.chevronRight.svg(),
                        ],
                      ),
                    ).paddingOnly(bottom: 8)
                  : Text(
                      itemTitle,
                      style: context.theme.body4.medium,
                    ).paddingOnly(bottom: 8),
              Text(
                '$itemInfoCost LD',
                style: context.theme.headline1,
              ).paddingOnly(bottom: 8),
              PaddingUtility.only(
                  bottom: underInfoCostText != null ? 32 : 0,
                  child: underInfoCostText ?? const SizedBox()),
              addButtons
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CustomButton(
                          title: firstButtonTitle!,
                          isEnabled: true,
                          isWhite: true,
                          onTap: onConfirmFirst!,
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: CustomButton(
                          title: secondButtonTitle!,
                          isEnabled: true,
                          isWhite: false,
                          onTap: onConfirmSecond!,
                        )),
                      ],
                    )
                  : const SizedBox(),
              tokenBalance ?? const SizedBox(),
              itemInfo ?? const SizedBox(),
            ],
          ),
        ),
      );
    },
  );
}
