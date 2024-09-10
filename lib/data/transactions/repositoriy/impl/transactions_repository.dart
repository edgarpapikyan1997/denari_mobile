import 'dart:developer';
import 'package:denari_app/data/transactions/model/send_to_contact/send_to_contact_model.dart';
import 'package:denari_app/data/transactions/model/transaction_model.dart';
import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:dio/dio.dart';
import '../../model/transaction_receive_model.dart';

final class ImplTransactionsRepository extends TransactionsRepository {
  final Dio _client;
  final Config _config;

  ImplTransactionsRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<TransactionReceiveModel?> sendTransaction(TransactionModel data) async
  {
    final result = await _client.post(
      '${_config.host}/transactions',
      data: data.toJson(),
    );

    if (result.statusCode == 201) {
      if (result.data != null && result.data.isNotEmpty) {
        final transaction = TransactionReceiveModel.fromJson(result.data);
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

  @override
  Future<String?> sendAmountToUser(SendToUserModel data, bool isToken) async {
    String tealApi = isToken == true ? 'gift/token' : 'gift/card';
    final result = await _client.post(
      '${_config.host}/$tealApi',
      data: data.toJson(),
    );
    return result.data.toString();
  }
}
