import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/screens/main_screen/brand_token_widget.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';

class TokenBalanceScreen extends StatefulWidget {
  const TokenBalanceScreen({super.key});

  @override
  State<TokenBalanceScreen> createState() => _TokenBalanceScreenState();
}

class _TokenBalanceScreenState extends State<TokenBalanceScreen> {
  final TokenBalanceState tokenBalanceState = TokenBalanceState();

  Widget getTokenBalance() {
    tokenBalanceState.getTokenBalance();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.media.icons.token.svg(),
        Text(
          tokenBalanceState.earnedToken.toString(),
          style: context.theme.headline1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 88),
          child: CustomAppBar(
            appBarColor: AppColors.yellowLight,
            leadingIcon: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Assets.media.icons.chevronLeft.svg()),
            title: Text(
              "balance.tokenBalance".tr(),
              style: context.theme.headline4,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              getTokenBalance(),
              SizedBox(
                height: 8,
              ),
              Text("balance.viewEarnedToken".tr()),
              SizedBox(
                height: 32,
              ),
              PreviewBanner(
                leadingBanner: Text(
                  'balamce.tokens'.tr(),
                  style: context.theme.headline2.bold,
                ),
              ),
              SizedBox(height: 16,),
              BrandTokenWidget(
                  avatar: 'M',
                  brandName: 'McDonalds',
                  lastUpdate: 'June 16, 2024, 18:23',
                  tokenBalance: getTokenBalance()),
            ],
          ),
        ));
  }
}
