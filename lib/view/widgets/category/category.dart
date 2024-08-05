import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../constants/categories.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';

class Category {
  final CategoryType type;
  final Color? iconColor;

  Category({required this.type, Color? iconColor})
      : iconColor = iconColor ?? AppColors.black;

  String get name {
    switch (type) {
      case CategoryType.all:
        return 'shops.all'.tr();
      case CategoryType.food:
        return 'main.food'.tr();
      case CategoryType.beauty:
        return 'main.beauty'.tr();
      case CategoryType.clothing:
        return 'main.clothing'.tr();
      case CategoryType.activities:
        return 'main.activities'.tr();
      case CategoryType.groceries:
        return 'main.groceries'.tr();
      case CategoryType.travel:
        return 'main.travel'.tr();
      case CategoryType.giftCard:
        return 'giftCard.giftCard'.tr();
      case CategoryType.tokens:
        return 'balance.tokens'.tr();
      case CategoryType.city:
        return 'shops.city'.tr();
      case CategoryType.town:
        return 'shops.town'.tr();
      case CategoryType.italian:
        return 'balance.tokens'.tr();
      case CategoryType.desert:
        return 'balance.tokens'.tr();
      case CategoryType.other:
        return 'main.other'.tr();
      case CategoryType.allNoIcon:
        return 'shops.all'.tr();
    }
  }

  Widget get icon {
    switch (type) {
      case CategoryType.all:
        return Assets.media.icons.food.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.food:
        return Assets.media.icons.food.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.beauty:
        return Assets.media.icons.beauty.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.clothing:
        return Assets.media.icons.clothing.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.activities:
        return Assets.media.icons.activities.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.groceries:
        return Assets.media.icons.groceries.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.travel:
        return Assets.media.icons.travel.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.giftCard:
        return Assets.media.icons.card.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.tokens:
        return Assets.media.icons.tokenWhite.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.other:
        return Assets.media.icons.other.svg(colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn));
      case CategoryType.city:
        return const SizedBox();
      case CategoryType.town:
        return const SizedBox();
      case CategoryType.italian:
        return const SizedBox();
      case CategoryType.desert:
        return const SizedBox();
      case CategoryType.allNoIcon:
        return const SizedBox();
    }
  }
}
