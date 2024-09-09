import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/data/gift_card/repository/impl/gift_card_repository_impl.dart';
import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
import 'package:denari_app/store/gift_card_balance_state/gift_card_balance_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/screens/send_gift_screen/gift_card_categories_widgets/item_selector_widget.dart';
import 'package:denari_app/view/widgets/balance_widget.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/categories_state/categories_state.dart';
import '../../../../utils/themes/app_colors.dart';
import '../../../constants/app_bar_type.dart';
import '../../../constants/categories.dart';
import '../../../data/token/repository/impl/token_repository_impl.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/token_balance_state/token_balance_state.dart';
import '../../../utils/di/config.dart';
import '../../widgets/category/category.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({super.key});

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  final LoadingState _loadingState = LoadingState();
  final TokenBalanceState _tokenBalanceState =
      TokenBalanceState(tokenRepository: di.get<ImplTokenRepository>());
  final GiftCardBalanceState _giftCardBalanceState = GiftCardBalanceState(
      giftCardRepository: di.get<ImplGiftCardRepository>());
  final BrandItemSelectState sendGiftItemSelectState = BrandItemSelectState();
  final BrandItemSelectState tokenItemSelectState = BrandItemSelectState();
  CategoriesState? categoriesState = CategoriesState();
  late final List<Category> categories;

  int? items = 15;
  bool isToken = true;

  @override
  void initState() {
    super.initState();
    initPrefs();
    categoriesState?.currentCategory == categories[0].name
        ? isToken = false
        : isToken = true;
  }

  Future<void> initPrefs() async {
    _loadingState.startLoading();
    categories = [
      Category(type: CategoryType.giftCard),
      Category(type: CategoryType.tokens),
    ];
    initCategories();
    await _tokenBalanceState.getTokenBalance();
    await _tokenBalanceState.getTokenBalanceHistory();
    await _giftCardBalanceState.getGiftCardBalance();
    await _giftCardBalanceState.getGiftCardBalanceHistory();
    _loadingState.stopLoading();
  }

  initCategories() {
    categoriesState?.selectCategory(
        categoryName: categories[0].name, newCategoryType: categories[0].type);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppSizes.prefSizes,
        child: CustomAppBar(
          appBarType: AppBarType.regular,
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
      body: Observer(builder: (context) {
        return PaddingUtility(
          all: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryFieldGenerator(
                categories: categories,
                categoriesState: categoriesState!,
                justSelector: true,
              ),
              const SizedBox(
                height: 24,
              ),
              _loadingState.isLoading == true
                  ? const Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator()),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          categoriesState?.currentCategory == categories[0].name
                              ? Expanded(
                                  child: ItemSelectorWidget(
                                    giftItems:
                                        _giftCardBalanceState.giftCardModels,
                                    sendGiftItemSelectState:
                                        sendGiftItemSelectState,
                                    isToken: false,
                                    previewTitle: 'giftCard.selectGift'.tr(),
                                  ),
                                )
                              : Expanded(
                                  child: ItemSelectorWidget(
                                    tokenItems: _tokenBalanceState.tokenModels,
                                    tokenItemSelectState: tokenItemSelectState,
                                    isToken: true,
                                    previewTitle:
                                        'giftCard.totalBalanceTokens'.tr(),
                                    tealButton: BalanceWidget(
                                      isTokenBalance: true,
                                      balance:
                                          _tokenBalanceState.balance!.toInt(),
                                      textStyle: context.theme.headline2.bold,
                                      tokenIconHeight: 20,
                                      tokenIconWidth: 18,
                                    ),
                                  ),
                                ),
                          CustomButton(
                            isEnabled: true,
                            isWhite: false,
                            title: 'giftCard.continue'.tr(),
                            onTap: () {
                              context.pushNamed(
                                "sendGiftCardScreen",
                                extra: BrandItemWidget(
                                  isToken: categoriesState?.currentCategory ==
                                          categories[0].name
                                      ? isToken = false
                                      : isToken = true,
                                  avatar: isToken
                                      ? _tokenBalanceState
                                          .tokenModels[
                                              tokenItemSelectState.index]
                                          .imageUrl
                                      : _giftCardBalanceState
                                          .giftCardModels[
                                              sendGiftItemSelectState.index]
                                          .imageUrl,
                                  brandName: isToken
                                      ? _tokenBalanceState
                                          .tokenModels[
                                              tokenItemSelectState.index]
                                          .name
                                      : _giftCardBalanceState
                                          .giftCardModels[
                                              sendGiftItemSelectState.index]
                                          .name,
                                  tokenBalance: isToken
                                      ? _tokenBalanceState
                                          .tokenModels[
                                              tokenItemSelectState.index]
                                          .shopUserTokens![0]
                                          .tokenBalance
                                          .toInt()
                                      : _giftCardBalanceState
                                          .giftCardModels[
                                              sendGiftItemSelectState.index]
                                          .shopGiftCardModel![0]
                                          .giftCardBalance,
                                  addDivider: false,
                                  topPadding: 8,
                                  bottomPadding: 8,
                                  leftPadding: 12,
                                  rightPadding: 12,
                                  wrapperColor: AppColors.whiteGrey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
