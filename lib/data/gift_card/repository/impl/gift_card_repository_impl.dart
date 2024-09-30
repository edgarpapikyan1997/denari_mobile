import 'package:denari_app/data/gift_card/model/gift_card_balance/gift_card_balance_model.dart';
import 'package:denari_app/data/gift_card/model/gift_card_model.dart';
import 'package:denari_app/data/gift_card/repository/gift_card_repository.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';
import '../../../../utils/env/config.dart';


final class ImplGiftCardRepository extends GiftCardRepository {
  final Dio _client;
  final Config _config;

  ImplGiftCardRepository({required Dio client, required Config config})
      : _client = client,
        _config = config;

  @override
  Future<List<GiftCardModel>> getUserGiftCardBalanceHistory() async {
    final result = await _client.get(
      '${_config.host}/shops/nonZeroBalance',
    );
    return result.list(GiftCardModel.fromJson);
  }


  @override
  Future<GiftCardBalanceModel> getGiftCardBalance() async {
    final result = await _client.get('${_config.host}/user/giftCardsBalance');
    return result.item(GiftCardBalanceModel.fromJson);
  }
}
