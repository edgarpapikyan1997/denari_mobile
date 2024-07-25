import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/fields/decoration_field.dart';

class SendGiftCardScreen extends StatelessWidget {
  final BrandItemWidget brandItemWidget;

  const SendGiftCardScreen({super.key, required this.brandItemWidget});

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
        body: PaddingUtility(
          all: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              brandItemWidget,
              const SizedBox(
                height: 32,
              ),
              TextField(
                decoration: DecorationField(
                  context: context,
                  controller: TextEditingController(),
                  hint: 'giftCard.amount'.tr(),
                  hintStyle: context.theme.body1.lightGreyText,
                ),
              )
            ],
          ),
        ));
  }
}
