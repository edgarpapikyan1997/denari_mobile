import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/categories_state/categories_state.dart';

enum SingingCharacter { lafayette, jefferson, lafayette1, jefferson1 }

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

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

  // @override
  // void initState() {
  //   super.initState();
  //   // _token.getTokenBalance();
  //   initCategories();
  // }
  //
  // initCategories() {
  //   categoriesState = CategoriesState(
  //     initialCategory: categories[0]['categoryName'].toString(),
  //   );
  // }
 Widget build(BuildContext context) {
   return Scaffold();
 }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: const Size(0, 88),
  //       child: CustomAppBar(
  //         leadingIcon: GestureDetector(
  //             onTap: () {
  //               context.go('/');
  //             },
  //             child: Assets.media.icons.chevronLeft.svg()),
  //         title: Text(
  //           "transactionHistoryScreen.title".tr(),
  //           style: context.theme.headline4,
  //         ),
  //       ),
  //     ),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CategoryFieldGenerator(
  //             categories: categories, categoriesState: categoriesState!),
  //         const SizedBox(
  //           height: 24,
  //         ),
  //         PreviewBanner(
  //           leadingBanner: Text(
  //             'transactionHistoryScreen.selectGiftCard'.tr(),
  //             style: context.theme.headline2.bold,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 24,
  //         ),
  //         BrandItemWidget(
  //           avatar: Assets.media.images.toyStory.path,
  //           brandName: 'McDonalds',
  //           tokenBalance: '20',
  //           tealButton: Radio<SingingCharacter>(
  //             value: SingingCharacter.jefferson,
  //             groupValue: _character,
  //             onChanged: (SingingCharacter? value) {
  //               setState(() {
  //                 _character = value;
  //               });
  //             },
  //           ),
  //         ),
  //         BrandItemWidget(
  //           avatar: Assets.media.images.toyStory.path,
  //           brandName: 'McDonalds',
  //           tokenBalance: '20',
  //           tealButton: Radio<SingingCharacter>(
  //             value: SingingCharacter.lafayette,
  //             groupValue: _character,
  //             onChanged: (SingingCharacter? value) {
  //               setState(() {
  //                 _character = value;
  //               });
  //             },
  //           ),
  //         ),
  //         BrandItemWidget(
  //           avatar: Assets.media.images.toyStory.path,
  //           brandName: 'McDonalds',
  //           tokenBalance: '20',
  //           tealButton: Radio<SingingCharacter>(
  //             value: SingingCharacter.lafayette1,
  //             groupValue: _character,
  //             onChanged: (SingingCharacter? value) {
  //               setState(() {
  //                 _character = value;
  //               });
  //             },
  //           ),
  //         ),
  //         BrandItemWidget(
  //           avatar: Assets.media.images.toyStory.path,
  //           brandName: 'McDonalds',
  //           tokenBalance: '20',
  //           tealButton: Radio<SingingCharacter>(
  //             fillColor: MaterialStateProperty.resolveWith<Color>(
  //                 (Set<MaterialState> states) {
  //               if (states.contains(MaterialState.disabled)) {
  //                 return Colors.orange.withOpacity(.32);
  //               }
  //               return Colors.black;
  //             }),
  //             focusColor: AppColors.black,
  //             autofocus: true,
  //             value: SingingCharacter.jefferson1,
  //             groupValue: _character,
  //             onChanged: (SingingCharacter? value) {
  //               setState(() {
  //                 _character = value;
  //               });
  //             },
  //           ),
  //         ),
  //       ],
  //     ).paddingOnly(left: 16),
  //   );
  // }
}
