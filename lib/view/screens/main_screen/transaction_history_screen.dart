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

 @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Column(),
   );
 }

}
