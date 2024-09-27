import 'package:denari_app/data/transactions/model/send_to_contact/send_to_contact_model.dart';
import 'package:denari_app/data/transactions/model/transaction_receive_model.dart';

import '../model/transaction_model.dart';

abstract class TransactionsRepository {
  Future<TransactionReceiveModel?> sendTransaction(TransactionModel data);

  Future<String?> sendAmountToUser(SendToUserModel data, bool isToken);

  Future<List<TransactionReceiveModel?>> getTransactionsHistory(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? stores,
      int? minAmount,
      int? maxAmount});
}
