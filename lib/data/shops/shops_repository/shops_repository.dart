import 'package:denari_app/data/shops/shops_model/shops_model.dart';

abstract class ShopsRepository {
  Future<List<ShopsModel>> getShops();
}
