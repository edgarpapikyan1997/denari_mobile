import 'dart:convert';
import 'dart:developer';

import 'package:denari_app/data/transactions/model/transaction_model.dart';
import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:dio/dio.dart';

final class ImplTransactionsRepository extends TransactionsRepository {
  final Dio _client;
  final Config _config;

  ImplTransactionsRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<TransactionModel?> sendTransaction(TransactionModel data) async {
    print(data.toJson());
    final result = await _client.post(
      '${_config.host}/transactions',
      data: data.toJson(),
    );
    print(result.data.toString());
    if (result.statusCode == 201) {
      if (result.data != null && result.data.isNotEmpty) {
        final transaction = TransactionModel.fromJson(result.data);
        return transaction;
      } else {
        log('No transaction data returned from the server, but the transaction was created.');
        return null;
      }
    } else {
      log('Failed to create transaction: ${result.statusCode}');
      return null;
    }
  }
}
