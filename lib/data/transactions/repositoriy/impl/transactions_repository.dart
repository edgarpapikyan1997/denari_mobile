import 'dart:convert';

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
    final result = await _client.post(
      '${_config.host}/transactions',
      data: jsonEncode(data.toJson()),
    );
    if (result.statusCode == 201) {
      final transaction = TransactionModel.fromJson(result.data);
      print("TRANSACTION REPOSITORY >>> id ${transaction.id}");
      return transaction;
    }
    print('No data received from the server');
    return null;
  }
}
