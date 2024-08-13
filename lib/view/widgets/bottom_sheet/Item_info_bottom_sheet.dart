import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../custom_button.dart';
import 'bottom_sheet_upper_piece.dart';

void showItemInfoBottomSheet({
  required BuildContext context,
  required VoidCallback onConfirm,
  required String itemTitle,
  bool addButtons = false,
  bool addCloseButton = false,
  Text? underInfoCostText,
  bool itemTitleChevronRight = false,
  String? dateTime,
  String? image,
  String? itemInfoCost = '0',
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: context.width,
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetUpperPiece(),
            addCloseButton
                ? Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Assets.media.icons.sloseCenter.svg()))
                    .paddingOnly(bottom: 4)
                : const SizedBox(),
            dateTime != null
                ? Text(
                    dateTime,
                    style: context.theme.body3,
                  ).paddingOnly(bottom: 16)
                : const SizedBox(),
            image != null
                ? Image.asset(
                    image,
                    height: 76,
                    width: 76,
                    // fit: BoxFit.cover,
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
                bottom: 32, child: underInfoCostText ?? const SizedBox()),
            addButtons
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomButton(
                        title: 'Send',
                        isEnabled: false,
                        isWhite: true,
                        onTap: () {},
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: CustomButton(
                        title: 'Use',
                        isEnabled: false,
                        isWhite: false,
                        onTap: () {},
                      )),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      );
    },
  );
}
