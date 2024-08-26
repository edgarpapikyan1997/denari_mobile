import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:mobx/mobx.dart';
import '../../../data/shops/shops_model/shops_model.dart';
import '../../../data/shops/shops_repository/shops_repository.dart';

part 'shops_state.g.dart';

class ShopsState = ShopsStatePerformer with _$ShopsState;

abstract class ShopsStatePerformer with Store {
  final ShopsRepository _shopsRepository;

  ShopsStatePerformer({
    required ShopsRepository shopsRepository,
  }) : _shopsRepository = shopsRepository;

  @observable
  List<ShopsModel> shops = [];

  @observable
  String? getError;

  @observable
  ShopsUnitModel? shopsUnitModel;

  @action
  Future<void> getAllShops() async {
    (await handle(() => _shopsRepository.getShops())).then(
      (data) => shops = data,
      (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }
  @action
  Future<void> getShopsByCategory({required String id}) async {
    (await handle(() => _shopsRepository.getShopsByCategory(shopID: id))).then(
          (data) => shops = data,
          (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @action
  Future<void> getShopByID({required String id}) async {
    (await handle(() => _shopsRepository.getShopByID(shopID: id))).then(
      (data) => shopsUnitModel = data,
      (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
