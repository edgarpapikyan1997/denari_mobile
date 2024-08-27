import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/data/transactions/model/transaction_model.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/custom_button.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants/bottom_sheet_type.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/padding_utility/padding_utility.dart';
import '../../widgets/bottom_sheet/custom_bottom_sheet.dart';

class QrGeneratorScreen extends StatelessWidget {
  final String transactionID;
  final TransactionModel transactionModel;
  final VoidCallback onTap;

  const QrGeneratorScreen(
      {super.key,
      required this.transactionID,
      required this.onTap,
      required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          leadingIcon: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Assets.media.icons.closeLeft.svg(),
          ),
          title: Text(
            'main.qrOfTransaction'.tr(),
            style: context.theme.body1.semiBold,
          ),
        ),
      ),
      body: PaddingUtility.only(
        left: 16,
        right: 16,
        bottom: 40,
        child: SizedBox(
          width: context.width,
          child: Column(
            children: [
              const Spacer(),
              QrImageView(
                data: '${transactionID}',
                size: 195,
              ),
              const Delimiter(16),
              Text(
                'main.showThisQr'.tr(),
                style: context.theme.body1.lightGreyText,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                'main.dontLeaveScreen'.tr(),
                style: context.theme.body1.semiBold,
                textAlign: TextAlign.center,
              ),
              const Delimiter(16),
              CustomButton(
                isEnabled: true,
                isWhite: false,
                title: 'buttons.close'.tr(),
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
