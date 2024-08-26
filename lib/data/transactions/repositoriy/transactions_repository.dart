import '../model/transaction_model.dart';

abstract class TransactionsRepository {
  Future<bool> sendTransaction(TransactionModel data);
}
