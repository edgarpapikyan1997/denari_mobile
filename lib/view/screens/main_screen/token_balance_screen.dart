import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/store/token_balance_state/token_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/preview_banner/preview_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../data/token/repository/impl/token_repository_impl.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/di/config.dart';
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
  final LoadingState _loadingState = LoadingState();
  final TokenBalanceState _tokenBalanceState = TokenBalanceState(
    tokenRepository: di.get<ImplTokenRepository>(),
  );
  int itemsLength = 0;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    _loadingState.startLoading();
    await _tokenBalanceState.getTokenBalance();
    await _tokenBalanceState.getTokenBalanceHistory();
    itemsLength = _tokenBalanceState.tokenModels.length;
    _loadingState.stopLoading();
    print(_tokenBalanceState.tokenModels);
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
            "balance.tokenBalance".tr(),
            style: context.theme.headline4,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (_loadingState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return _tokenBalanceState.balance == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NoDataWidget(
                    asset: Assets.media.images.cryptoCurrencyNamecoin.image(
                      height: 96,
                      width: 96,
                    ),
                    title: "balance.emptyBalance".tr(),
                    description: "balance.emptyBalanceDescription".tr(),
                  ),
                  const SizedBox(),
                ],
              )
            : Container(
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
                      balance: _tokenBalanceState.balance!,
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
                      leadingBanner: 'balance.tokens'.tr(),
                    ),
                    Expanded(
                      child: BrandItemList(
                        brandItems: List.generate(
                          _tokenBalanceState.tokenModels.length,
                          (index) => BrandItemWidget(
                            isToken: true,
                            avatar:
                                _tokenBalanceState.tokenModels[index].imageUrl,
                            brandName:
                                _tokenBalanceState.tokenModels[index].name,
                            secondaryInfo: _tokenBalanceState
                                            .tokenModels[index].description !=
                                        null ||
                                    _tokenBalanceState
                                        .tokenModels[index].description!.isEmpty
                                ? null
                                : Text(
                                    "${_tokenBalanceState.tokenModels[index].description}",
                                  ),
                            tokenBalance: _tokenBalanceState.tokenModels[index]
                                    .shopUserTokens?[0].tokenBalance
                                    .toInt() ??
                                0,
                            // tealButton: Icon(Icons.chevron_right),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
