import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/bottom_sheet_upper_piece.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/filter_widgets/new_purchase_filter/purchase_amount_configurator.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';

import '../../../../utils/extensions/extensions.dart';
import '../../../screens/qr_generator_screen/qr_generator_screen.dart';
import '../../bottom_sheet/variants/modal_sheet.dart';

class NewPurchaseFilter extends StatelessWidget {
  const NewPurchaseFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.only(
      top: 8,
      bottom: 40,
      left: 16,
      right: 16,
      child: Column(
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
            previewTitle: 'shops.redeemGift'.tr(),
            isToken: false,
          ),
          const Delimiter(24),
          PurchaseAmountConfigurator(
            previewTitle: 'shops.redeemToken'.tr(),
            isToken: true,
          ),
          const Delimiter(24),
          CustomButton(
              isEnabled: true,
              isWhite: false,
              title: 'buttons.close'.tr(),
              onTap: () {
                showModalSheet(
                  context: context,
                  child: SizedBox(
                    width: context.width,
                    child: const QrGeneratorScreen(
                      userID: '12345678',
                      token: 'token',
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
