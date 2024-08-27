import 'package:denari_app/data/transactions/repositoriy/transactions_repository.dart';
import 'package:mobx/mobx.dart';
import '../../data/authentication/repository/auth_repository.dart';
import '../../data/transactions/model/transaction_model.dart';
import '../../utils/network/utils/use_case.dart';

part 'transactions_state.g.dart';

class TransactionsState = ImplTransactionsState with _$TransactionsState;

abstract class ImplTransactionsState with Store {
  final TransactionsRepository _transactionsRepository;

  ImplTransactionsState({
    required TransactionsRepository transactionsRepository,
  }) : _transactionsRepository = transactionsRepository;

  @observable
  TransactionModel transactionModel = TransactionModel.fromJson({});

  @observable
  String? getError;

  @observable
  String? transactionID;

  @observable
  String isSuccessful = '';

  @action
  Future<void> sendTransaction(TransactionModel transactionModel) async {
    await _transactionsRepository.sendTransaction(transactionModel).then(
          (data) => isSuccessful = 'true',
      onError: (error) => getError = error,
    );
  }
}
