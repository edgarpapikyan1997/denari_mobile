import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';

import '../shops_model/shops_model.dart';

abstract class ShopsRepository {
  Future<List<ShopsModel>> getShops();
  Future<List<ShopsModel>> getShopsByCategory({required String categories});
  Future<ShopsUnitModel> getShopByID({required String shopID});
}
