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
      ObservableList<bool>();

  @observable
  ObservableList<bool> addressCheckBoxValues =
      ObservableList<bool>();

  @observable
  String? getError;

  @observable
  ShopsUnitModel? shopsUnitModel;

  @observable
  List<ShopsUnitModel> shopsUnitModelList = [];

  @observable
  ObservableList<Map<String, dynamic>> checkedStoreItems =
      ObservableList<Map<String, dynamic>>();

  @observable
  ObservableList<Map<String, dynamic>> checkedAddressItems =
      ObservableList<Map<String, dynamic>>();

  @computed
  bool get isAnyCheckBoxSelected => checkBoxValues.contains(true);

  @action
  void updateCheckBox({required int index, bool isAddress = false}) {
    if (isAddress == false) {
      checkBoxValues[index] = !checkBoxValues[index];
      if (checkBoxValues[index] == true) {
        checkedStoreItems.add({shops[index].id: shops[index].name});
      }
      if (checkBoxValues[index] == false) {
        checkedStoreItems
            .removeWhere((element) => element.containsKey(shops[index].id));
      }
    } else {
      addressCheckBoxValues[index] = !addressCheckBoxValues[index];
      if (addressCheckBoxValues[index] == true) {
        checkedAddressItems.add({shops[index].id: shops[index].name});
      }
      if (addressCheckBoxValues[index] == false) {
        checkedAddressItems
            .removeWhere((element) => element.containsKey(shops[index].id));
      }
    }
  }

  @action
  void checkBoxReset() {
    for (int i = 0; i < checkBoxValues.length; i++) {
      checkBoxValues[i] = false;
      checkedStoreItems.clear();
      checkedStoreItems = ObservableList<Map<String, dynamic>>();
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

  @action
  Future<void> getShopByIDtoList(
      {required List<Map<String, dynamic>> items}) async {
    await handle(() async {
      await Future.forEach(items, (Map<String, dynamic> item) async {
        final shopUnit =
            await _shopsRepository.getShopByID(shopID: item.keys.first);
        shopsUnitModelList.add(shopUnit);
      });
      addressCheckBoxValues =
      ObservableList<bool>.of(List<bool>.filled(shopsUnitModelList.length, false));
    }).then(
      (data) {
      },
      onError: (error) {
        getError = error;
      },
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
