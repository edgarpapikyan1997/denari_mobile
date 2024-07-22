import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/brand_item/brand_item_list.dart';
import '../../widgets/brand_item/brand_item_widget.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/preview_banner/preview_banner.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({super.key});

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
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
  CategoriesState? categoriesState;

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

  int value = 0;

  List<BrandItemWidget> getItems() {
    return List.generate(
        24,
        (index) => BrandItemWidget(
          avatar: Assets.media.images.toyStory.path,
          brandName: 'McDonalds',
          secondaryInfo: '50 LD',
          tealButton: SizedBox(
            height: 24,
            width: 24,
            child: Radio(
              value: index,
              groupValue: value,
              fillColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.black; // Selected color
                  }
                  return AppColors.greyLight; // Unselected color
                },
              ),
              onChanged: (index) {
                setState(() {
                  value = index!;
                });
              },
            ),
          ),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryFieldGenerator(
              categories: categories, categoriesState: categoriesState!),
          const SizedBox(
            height: 24,
          ),
          PreviewBanner(
            leadingBanner: Text(
              'giftCard.selectGift'.tr(),
              style: context.theme.headline2.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: BrandItemList(
              brandItems: getItems(),
            ),
          )
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
