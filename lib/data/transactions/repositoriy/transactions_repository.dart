import 'package:denari_app/data/transactions/model/transaction_receive_model.dart';

import '../model/transaction_model.dart';

abstract class TransactionsRepository {
  Future<TransactionReceiveModel?> sendTransaction(TransactionModel data);
}
