import 'dart:convert';

import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';

final class ImplProfileRepository extends ProfileRepository {
  final Dio _client;
  final Config _config;

  ImplProfileRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<ProfileModel> getProfile() async {
    final result = await _client.get('${_config.host}/user');
    return result.item(ProfileModel.fromJson);
  }

  @override
  Future<bool> updateProfile(ProfileModel profile) async {
    final result = await _client.put(
      '${_config.host}/user',
      data: jsonEncode(profile.toJson()),
    );
    return result.statusCode == 200;
  }
}
