import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/constants/categories.dart';
import 'package:denari_app/data/shops/shops_repository/shops_repository.dart';
import 'package:denari_app/store/categories_state/categories_state.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/shop_tems.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../store/loading_state/loading_state.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../store_field_screen/widgets/store_field_generator.dart';

class ChosenCategoryScreen extends StatefulWidget {
  final CategoriesState? categoriesState;

  const ChosenCategoryScreen({
    super.key,
    required this.categoriesState,
  });

  @override
  State<ChosenCategoryScreen> createState() => _ChosenCategoryScreenState();
}

class _ChosenCategoryScreenState extends State<ChosenCategoryScreen> {
  final ShopsState _shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  final LoadingState _loadingState = LoadingState();
  CategoriesState? categoriesState;


  @override
  void initState() {
    super.initState();
    initPrefs();
  }


  void initPrefs() async {
    _loadingState.startLoading();
    if (widget.categoriesState != null) {
      categoriesState = widget.categoriesState;
    }
    print(categoriesState!.currentCategory!);
    await  _shopsState.getShopsByCategory(
        categories: widget.categoriesState!.currentCategory!);
    print(_shopsState.shops);
    _loadingState.stopLoading();
  }

  Widget getItemsByCategory() {
    return StoreFieldGenerator(
      isGrid: true,
      storeFieldList: _shopsState.shops,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppSizes.prefSizes,
          child: CustomAppBar(
            appBarType: AppBarType.regular,
            title: Text(
              categoriesState?.currentCategory ?? '',
              style: context.theme.body1.semiBold.black,
            ),
            leadingIcon: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Assets.media.icons.chevronLeft.svg()),
            tealIcon: Row(
              children: [
                Assets.media.icons.search.svg(),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                    onTap: () {
                      context.push(
                        '/shopScreenFilter',
                      );
                    },
                    child: Assets.media.icons.filter.svg()),
              ],
            ),
          ),
        ),
        body: _loadingState.isLoading == true
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : PaddingUtility.only(
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Expanded(child: getItemsByCategory()),
                  ],
                ),
              ),
      );
    });
  }
}
