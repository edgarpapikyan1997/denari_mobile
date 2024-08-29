import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:mobx/mobx.dart';
import '../../data/transactions/model/transaction_model.dart';
import '../../data/transactions/model/transaction_receive_model.dart';
part 'transactions_state.g.dart';

class TransactionsState = ImplTransactionsState with _$TransactionsState;

abstract class ImplTransactionsState with Store {
  final TransactionsRepository _transactionsRepository;

  ImplTransactionsState({
    required TransactionsRepository transactionsRepository,
  }) : _transactionsRepository = transactionsRepository;

  @observable
  TransactionModel? transactionModel;

  @observable
  TransactionReceiveModel? transactionReceiveModel;

  @observable
  String? getError;

  @observable
  String? transactionID;

  @observable
  bool isSuccessful = false;


  @action
  Future<bool> sendTransaction(TransactionModel transactionModel) async {
    try {
      final data = await _transactionsRepository.sendTransaction(transactionModel);
      if (data != null) {
        isSuccessful = true;
        transactionReceiveModel = data;
      } else {
        isSuccessful = false;
      }
    } catch (error) {
      getError = error.toString();
      isSuccessful = false;
    }
    return isSuccessful;
  }

}
