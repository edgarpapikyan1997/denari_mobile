import 'package:denari_app/data/advertisements/model/advertisement_model.dart';
import 'package:denari_app/data/advertisements/repository/advertisements_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';

final class ImplAdvertisementsRepository extends AdvertisementsRepository {
  final Dio _client;
  final Config _config;

  ImplAdvertisementsRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<List<AdvertisementModel>> getAdvertisements() async {
    final result = await _client.get('${_config.host}/advertising');
    return result.list(AdvertisementModel.fromJson);
  }
}
