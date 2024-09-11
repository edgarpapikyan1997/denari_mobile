import 'dart:convert';
import 'dart:developer';
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
    print(contactInfo);
      final result = await _client.post(
        '${_config.host}/user/findUserByContactInfo',
        data: jsonEncode({
          'contactInfo': contactInfo,
        }),
      );
      print("RESULT STATUS CODE >>> ${result.statusCode == 200}");
      return result.statusCode == 200;;
    }
  }

