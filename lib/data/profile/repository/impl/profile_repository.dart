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

  @override
  Future<bool> invite(String contact) async {
    final result = await _client.get(
      '${_config.host}/invite',
      queryParameters: {'contact': contact},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> changeGpsState(bool state) async {
    final result = await _client.post(
      '${_config.host}/user/toggle-gps',
      data: jsonEncode({'allowGPSLocation': state}),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> changeNotificationsState(bool transState, bool advState) async {
    final result = await _client.post(
      '${_config.host}/user/toggle-notifications',
      data: jsonEncode({
        'toggleTransaction': transState,
        'toggleAdvertisements': advState,
      }),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> deleteProfile() async {
    final result = await _client.delete('${_config.host}/deleteAccount');
    return result.statusCode == 200;
  }
}
