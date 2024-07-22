import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/balance_widget.dart';
import '../../widgets/brand_item/brand_item_list.dart';
import '../../widgets/brand_item/brand_item_widget.dart';
import '../../widgets/no_data_widget.dart';

class TokenBalanceScreen extends StatefulWidget {
  const TokenBalanceScreen({super.key});

  @override
  State<TokenBalanceScreen> createState() => _TokenBalanceScreenState();
}

class _TokenBalanceScreenState extends State<TokenBalanceScreen> {
  final _tokenBalanceState = TokenBalanceState();

  /// Must set list of models

  final brandItems = [
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),
    BrandItemWidget(
      avatar: Assets.media.images.toyStory.path,
      brandName: 'McDonalds',
      lastUpdate: 'June 16, 2024, 18:23',
      tokenBalance: TokenBalanceState().getTokenBalanceByBrand(),
      // tealButton: Icon(Icons.chevron_right),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 88),
        child: CustomAppBar(
          leadingIcon: GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Assets.media.icons.chevronLeft.svg()),
          title: Text(
            "balance.tokenBalance".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: _tokenBalanceState.earnedToken != 0
          ? Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  BalanceWidget(
                    isTokenBalance: true,
                    tokenIconHeight: 26,
                    tokenIconWidth: 28,
                    balance: '100',
                    textStyle: context.theme.headline1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("balance.viewEarnedToken".tr()),
                  const SizedBox(
                    height: 32,
                  ),
                  PreviewBanner(
                    leadingBanner: Text(
                      'balance.tokens'.tr(),
                      style: context.theme.headline2.bold,
                    ),
                  ),
                 const SizedBox(
                    height: 16,
                  ),
                  Expanded(child: BrandItemList(brandItems: brandItems, itemsToLoad: 8,))
                ],
              ),
            )
          : NoDataWidget(
              asset: Assets.media.images.cryptoCurrencyNamecoin.image(
                height: 96,
                width: 96,
              ),
              title: "balance.emptyBalance".tr(),
              description: "balance.emptyBalanceDescription".tr()
            ),
    );
  }
}
