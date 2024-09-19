import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:mobx/mobx.dart';
import '../../../data/shops/shops_model/shops_model.dart';
import '../../../data/shops/shops_repository/shops_repository.dart';

part 'shops_state.g.dart';

class ShopsState = ShopsStatePerformer with _$ShopsState;

abstract class ShopsStatePerformer with Store {
  final ShopsRepository _shopsRepository;

  ShopsStatePerformer({
    required ShopsRepository shopsRepository,
  }) : _shopsRepository = shopsRepository;

  @observable
  List<ShopsModel> shops = [];

  @observable
  ObservableList<bool> checkBoxValues =
      ObservableList<bool>(); // Use ObservableList

  @observable
  ObservableList<bool> addressCheckBoxValues =
      ObservableList<bool>(); // Use ObservableList

  @observable
  String? getError;

  @observable
  ShopsUnitModel? shopsUnitModel;

  @observable
  ObservableList<String> checkedStoreNames = ObservableList<String>();

  @observable
  ObservableList<String> checkedAddressNames = ObservableList<String>();

  @computed
  bool get isAnyCheckBoxSelected => checkBoxValues.contains(true);

  @action
  void updateCheckBox({required int index, bool isAddress = false}) {
    if (isAddress == false) {
      checkBoxValues[index] = !checkBoxValues[index];
      if (checkBoxValues[index] == true) {
        checkedStoreNames.add(shops[index].name);
      }
      if (checkBoxValues[index] == false) {
        checkedStoreNames.remove(shops[index].name);
      }
    } else {
      addressCheckBoxValues[index] = !addressCheckBoxValues[index];
      if (addressCheckBoxValues[index] == true) {
        checkedAddressNames.add(shops[index].name);
      }
      if (addressCheckBoxValues[index] == false) {
        checkedAddressNames.remove(shops[index].name);
      }
    }
  }

  @action
  void checkBoxReset() {
    for (int i = 0; i < checkBoxValues.length; i++) {
      checkBoxValues[i] = false;
      checkedStoreNames.clear();
      checkedStoreNames = ObservableList<String>();
    }
  }

  @action
  Future<void> getAllShops() async {
    (await handle(() => _shopsRepository.getShops())).then(
      (data) {
        shops = data;
        checkBoxValues =
            ObservableList<bool>.of(List<bool>.filled(shops.length, false));
      },
      (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @action
  Future<void> getShopsByCategory({required String categories}) async {
    (await handle(
            () => _shopsRepository.getShopsByCategory(categories: categories)))
        .then(
      (data) => shops = data,
      (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @action
  Future<void> getShopByID({required String id}) async {
    (await handle(() => _shopsRepository.getShopByID(shopID: id))).then(
      (data) => shopsUnitModel = data,
      (error) => getError = error,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
