import 'package:denari_app/data/gift_card/model/gift_card_model.dart';
import 'package:denari_app/data/gift_card/repository/gift_card_repository.dart';
import 'package:mobx/mobx.dart';
import '../../data/gift_card/model/gift_card_balance/gift_card_balance_model.dart';


part 'gift_card_balance_state.g.dart';

class GiftCardBalanceState = ImplGiftCardBalanceState
    with _$GiftCardBalanceState;

abstract class ImplGiftCardBalanceState with Store {
  final GiftCardRepository? _giftCardRepository;

  ImplGiftCardBalanceState({
    required GiftCardRepository? giftCardRepository,
  }) : _giftCardRepository = giftCardRepository;

  @observable
  int? balance = 0;

  @observable
  List<GiftCardModel> giftCardModels = [];

  @observable
  GiftCardBalanceModel? giftCardBalance;

  @observable
  String? getError;

  @action
  Future<void> getGiftCardBalance() async {
    try {
      final data = await _giftCardRepository!.getGiftCardBalance();
      giftCardBalance = data;
      balance = giftCardBalance!.giftCardBalance;
    } catch (error) {
      getError = error.toString();
      balance = 0;
    }
  }

  @action
  Future<void> getGiftCardBalanceHistory() async {
    try {
      final List<GiftCardModel> data =
          await _giftCardRepository!.getUserGiftCardBalanceHistory();
      giftCardModels = data;
    } catch (error) {
      getError = error.toString();
    }
  }
}
