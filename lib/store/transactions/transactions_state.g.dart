// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionsState on ImplTransactionsState, Store {
  late final _$transactionModelAtom =
      Atom(name: 'ImplTransactionsState.transactionModel', context: context);

  @override
  TransactionModel? get transactionModel {
    _$transactionModelAtom.reportRead();
    return super.transactionModel;
  }

  @override
  set transactionModel(TransactionModel? value) {
    _$transactionModelAtom.reportWrite(value, super.transactionModel, () {
      super.transactionModel = value;
    });
  }

  late final _$transactionReceiveModelAtom = Atom(
      name: 'ImplTransactionsState.transactionReceiveModel', context: context);

  @override
  TransactionReceiveModel? get transactionReceiveModel {
    _$transactionReceiveModelAtom.reportRead();
    return super.transactionReceiveModel;
  }

  @override
  set transactionReceiveModel(TransactionReceiveModel? value) {
    _$transactionReceiveModelAtom
        .reportWrite(value, super.transactionReceiveModel, () {
      super.transactionReceiveModel = value;
    });
  }

  late final _$transactionHistoryModelsAtom = Atom(
      name: 'ImplTransactionsState.transactionHistoryModels', context: context);

  @override
  List<TransactionReceiveModel?> get transactionHistoryModels {
    _$transactionHistoryModelsAtom.reportRead();
    return super.transactionHistoryModels;
  }

  @override
  set transactionHistoryModels(List<TransactionReceiveModel?> value) {
    _$transactionHistoryModelsAtom
        .reportWrite(value, super.transactionHistoryModels, () {
      super.transactionHistoryModels = value;
    });
  }

  late final _$getErrorAtom =
      Atom(name: 'ImplTransactionsState.getError', context: context);

  @override
  String? get getError {
    _$getErrorAtom.reportRead();
    return super.getError;
  }

  @override
  set getError(String? value) {
    _$getErrorAtom.reportWrite(value, super.getError, () {
      super.getError = value;
    });
  }

  late final _$transactionIDAtom =
      Atom(name: 'ImplTransactionsState.transactionID', context: context);

  @override
  String? get transactionID {
    _$transactionIDAtom.reportRead();
    return super.transactionID;
  }

  @override
  set transactionID(String? value) {
    _$transactionIDAtom.reportWrite(value, super.transactionID, () {
      super.transactionID = value;
    });
  }

  late final _$isSuccessfulAtom =
      Atom(name: 'ImplTransactionsState.isSuccessful', context: context);

  @override
  bool get isSuccessful {
    _$isSuccessfulAtom.reportRead();
    return super.isSuccessful;
  }

  @override
  set isSuccessful(bool value) {
    _$isSuccessfulAtom.reportWrite(value, super.isSuccessful, () {
      super.isSuccessful = value;
    });
  }

  late final _$sendTransactionAsyncAction =
      AsyncAction('ImplTransactionsState.sendTransaction', context: context);

  @override
  Future<bool> sendTransaction(TransactionModel transactionModel) {
    return _$sendTransactionAsyncAction
        .run(() => super.sendTransaction(transactionModel));
  }

  late final _$sendAmountToUserAsyncAction =
      AsyncAction('ImplTransactionsState.sendAmountToUser', context: context);

  @override
  Future<void> sendAmountToUser(SendToUserModel data, bool isToken) {
    return _$sendAmountToUserAsyncAction
        .run(() => super.sendAmountToUser(data, isToken));
  }

  late final _$getTransactionsHistoryAsyncAction = AsyncAction(
      'ImplTransactionsState.getTransactionsHistory',
      context: context);

  @override
  Future<void> getTransactionsHistory(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? stores,
      int? minAmount,
      int? maxAmount}) {
    return _$getTransactionsHistoryAsyncAction.run(() => super
        .getTransactionsHistory(
            startDate: startDate,
            endDate: endDate,
            stores: stores,
            minAmount: minAmount,
            maxAmount: maxAmount));
  }

  @override
  String toString() {
    return '''
transactionModel: ${transactionModel},
transactionReceiveModel: ${transactionReceiveModel},
transactionHistoryModels: ${transactionHistoryModels},
getError: ${getError},
transactionID: ${transactionID},
isSuccessful: ${isSuccessful}
    ''';
  }
}
