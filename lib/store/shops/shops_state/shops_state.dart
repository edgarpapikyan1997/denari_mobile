import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/data/shops/shops_repository/shops_repository.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

import '../../../data/shops/shops_model/shops_model.dart';

part 'shops_state.g.dart';

class ShopsState = ShopsStatePerformer with _$ShopsState;

abstract class ShopsStatePerformer with Store {
  final AuthRepository _authRepository;
  final ShopsRepository _shopsRepository;

  ShopsStatePerformer({
    required AuthRepository authRepository,
    required ShopsRepository shopsRepository,
  })  : _authRepository = authRepository,
        _shopsRepository = shopsRepository;

  @observable
  List<ShopsModel> shops = [];

  @action
  Future<void> getAllShops() async {
    (await handle(() => _tokenRepository!.getTokenBalance())).then(
          (data) => tokenBalance = data,
          (error) => getError = error,
    );
  }

}
