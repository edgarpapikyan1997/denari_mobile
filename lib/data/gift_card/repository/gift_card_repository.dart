import 'package:denari_app/data/gift_card/model/gift_card_balance/gift_card_balance_model.dart';
import 'package:denari_app/data/gift_card/model/gift_card_model.dart';

abstract class GiftCardRepository {
  Future<List<GiftCardModel>> getUserGiftCardBalanceHistory();

  Future<GiftCardBalanceModel> getGiftCardBalance();
}
