import 'dart:convert';

import 'package:denari_app/data/authentication/model/login_model.dart';
import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/model/reset_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/model/api_token.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';


final class ImplAuthRepository extends AuthRepository {
  final Dio _client;
  final Config _config;

  ImplAuthRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<ApiToken> login(LoginModel data) async {
    final result = await _client.post(
      '${_config.host}/login',
      data: jsonEncode(data.toJson()),
    );
    return result.item(ApiToken.fromJson);
  }

  @override
  Future<ApiToken> register(RegModel data) async {
    final result = await _client.post(
      '${_config.host}/register',
      data: jsonEncode(data.toJson()),
    );
    return result.item(ApiToken.fromJson);
  }

  @override
  Future<bool> verify(String phone) async {
    final result = await _client.post(
      '${_config.host}/verify',
      data: jsonEncode({'phone': phone}),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> reset(ResetModel data) async {
    final result = await _client.post(
      '${_config.host}/reset-password',
      data: jsonEncode(data.toJson()),
    );
    return result.statusCode == 200;
  }
}
