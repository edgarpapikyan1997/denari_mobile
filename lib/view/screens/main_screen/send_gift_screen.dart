import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/brand_item/brand_item_widget.dart';
import '../../widgets/category/category_field_generator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/preview_banner/preview_banner.dart';

enum SingingCharacter { lafayette, jefferson, lafayette1, jefferson1 }

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({super.key});

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;

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
    categoriesState?.currentCategory =  categories[0]['categoryName'].toString();

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
            "transactionHistoryScreen.title".tr(),
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
              'transactionHistoryScreen.selectGiftCard'.tr(),
              style: context.theme.headline2.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          BrandItemWidget(
            avatar: Assets.media.images.toyStory.path,
            brandName: 'McDonalds',
            tokenBalance: 20,
            tealButton: Radio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          BrandItemWidget(
            avatar: Assets.media.images.toyStory.path,
            brandName: 'McDonalds',
            tokenBalance: 20,
            tealButton: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          BrandItemWidget(
            avatar: Assets.media.images.toyStory.path,
            brandName: 'McDonalds',
            tokenBalance: 20,
            tealButton: Radio<SingingCharacter>(
              value: SingingCharacter.lafayette1,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          BrandItemWidget(
            avatar: Assets.media.images.toyStory.path,
            brandName: 'McDonalds',
            tokenBalance: 20,
            tealButton: Radio<SingingCharacter>(
              fillColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.orange.withOpacity(.32);
                }
                return Colors.black;
              }),
              focusColor: AppColors.black,
              autofocus: true,
              value: SingingCharacter.jefferson1,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ).paddingOnly(left: 16),
    );
  }
}
