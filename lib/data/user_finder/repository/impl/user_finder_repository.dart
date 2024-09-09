import 'dart:convert';
import 'dart:developer';
import 'package:denari_app/data/user_finder/model/user_finder_model.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';
import '../../../../utils/env/config.dart';
import '../user_finder_repository.dart';

final class ImplUserFinderRepository extends UserFinderRepository {
  final Dio _client;
  final Config _config;

  ImplUserFinderRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<String?> findUser(String contactInfo) async {
    try {
      final result = await _client.post(
        '${_config.host}/user/findUserByContactInfo',
        data: jsonEncode({
          'contactInfo': contactInfo,
        }),
      );
      return result.data;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
