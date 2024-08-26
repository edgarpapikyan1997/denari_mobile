import 'dart:async';

import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';
import '../../shops_model/shops_model.dart';
import '../shops_repository.dart';

final class ImplShopsRepository extends ShopsRepository {
  final Dio _client;
  final Config _config;

  ImplShopsRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<List<ShopsModel>> getShops() async {
    final result = await _client.get('${_config.host}/shops/filter');
    return result.list(ShopsModel.fromJson);
  }

  @override
  Future<List<ShopsModel>> getShopsByCategory(
      {required String categories}) async {
    final result = await _client.get('${_config.host}/shops/filter',
        queryParameters: {'categories': categories});
    return result.list(ShopsModel.fromJson);
  }

  @override
  Future<ShopsUnitModel> getShopByID({required String shopID}) async {
    final result = await _client.get(
      '${_config.host}/shops/{$shopID}',
    );
    return result.item(ShopsUnitModel.fromJson);
  }
}
