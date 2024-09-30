import 'dart:convert';
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
  Future<bool> findUser(String contactInfo) async {
      final result = await _client.post(
        '${_config.host}/user/findUserByContactInfo',
        data: jsonEncode({
          'contactInfo': contactInfo,
        }),
      );
      return result.statusCode == 200;
    }
  }

