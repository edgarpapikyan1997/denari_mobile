import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:mobx/mobx.dart';
import '../../data/transactions/model/transaction_model.dart';
part 'transactions_state.g.dart';

class TransactionsState = ImplTransactionsState with _$TransactionsState;

abstract class ImplTransactionsState with Store {
  final TransactionsRepository _transactionsRepository;

  ImplTransactionsState({
    required TransactionsRepository transactionsRepository,
  }) : _transactionsRepository = transactionsRepository;

  @observable
  TransactionModel? transactionModel = TransactionModel.fromJson({});

  @observable
  String? getError;

  @observable
  String? transactionID;

  @observable
  bool isSuccessful = false;


  @action
  Future<String?> sendTransaction(TransactionModel transactionModel) async {
    try {
      final data = await _transactionsRepository.sendTransaction(transactionModel);
      if (data != null) {
        isSuccessful = true;
        this.transactionModel = data;
      } else {
        isSuccessful = false;
      }
    } catch (error) {
      getError = error.toString();
    }
    return null;
  }

}
