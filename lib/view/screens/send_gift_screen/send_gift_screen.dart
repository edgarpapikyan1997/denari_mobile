import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
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
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({super.key});

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  final BrandItemSelectState sendGiftItemSelectState = BrandItemSelectState();
  final BrandItemSelectState tokenItemSelectState = BrandItemSelectState();
  CategoriesState? categoriesState;

  int? items = 15;
  final categories = [
    {
      'categoryName': 'giftCard.giftCard'.tr(),
      'categoryIcon': Assets.media.icons.card.svg()
    },
    {
      'categoryName': 'balance.tokens'.tr(),
      'categoryIcon': Assets.media.icons.tokenWhite.svg()
    },
  ];

  @override
  void initState() {
    super.initState();
    initCategories();
  }

  initCategories() {
    categoriesState = CategoriesState(
      initialCategory: categories[0]['categoryName'].toString(),
    );
  }

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
              ),
              const SizedBox(
                height: 24,
              ),
              categoriesState?.selectedCategory ==
                      categories[0]['categoryName'].toString()
                  ? Expanded(
                      child: ItemSelectorWidget(
                        items: items,
                        brandItemSelectState: sendGiftItemSelectState,
                        isToken: false,
                        previewTitle: 'giftCard.selectGift'.tr(),
                      ),
                    )
                  : Expanded(
                      child: ItemSelectorWidget(
                        items: items,
                        brandItemSelectState: tokenItemSelectState,
                        isToken: true,
                        previewTitle: 'giftCard.totalBalanceTokens'.tr(),
                        tealButton: BalanceWidget(
                          isTokenBalance: true,
                          balance: '50',
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
                  context.goNamed(
                    "sendGiftCardScreen",
                    extra: BrandItemWidget(
                      avatar: Assets.media.images.toyStory.path,
                      brandName: 'McDonalds',
                      tokenBalance: 50,
                      addDivider: false,
                      topPadding: 8,
                      bottomPadding: 8,
                      leftPadding: 12,
                      rightPadding: 12,
                      wrapperColor: AppColors.whiteGrey,
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
