import '../model/transaction_model.dart';

abstract class TransactionsRepository {
  Future<TransactionModel?> sendTransaction(TransactionModel data);
}
