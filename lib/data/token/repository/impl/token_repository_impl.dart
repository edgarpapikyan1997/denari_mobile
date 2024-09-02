import 'dart:developer';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';

import '../../../../utils/env/config.dart';
import '../../model/token_balance/token_balance_model.dart';
import '../../model/token_model.dart';
import '../token_repository.dart';

final class ImplTokenRepository extends TokenRepository {
  final Dio _client;
  final Config _config;

  ImplTokenRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<List<TokenModel>> getUserTokenBalanceHistory() async {
    final result = await _client.get(
      '${_config.host}/shops/nonZeroTokens',
    );
    return result.list(TokenModel.fromJson);
  }

  @override
  Future<TokenBalanceModel> getTokenBalance() async {
    final result = await _client.get('${_config.host}/user/tokenBalance');
    return result.item(TokenBalanceModel.fromJson);
  }
}
