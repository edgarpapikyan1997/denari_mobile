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
  List<Map<String, dynamic>> chosenAddressItems = [];

  @observable
  List<ShopsUnitModel> shopsUnitModelList = [];

  @observable
  List<Map<String, dynamic>> checkedStoreItems = [];

  @observable
  List<Map<String, dynamic>> checkedAddressItems = [];

  @observable
  ObservableList<bool> checkBoxValues = ObservableList<bool>();

  @observable
  ObservableList<bool> addressCheckBoxValues = ObservableList<bool>();

  @observable
  String? getError;

  @observable
  ShopsUnitModel? shopsUnitModel;

  @computed
  bool get isAnyCheckBoxSelected {
    bool anyStoreSelected = checkBoxValues.contains(true);

    bool anyAddressSelected = addressCheckBoxValues.contains(true);

    bool anyItemsSelected =
        checkedStoreItems.isNotEmpty || checkedAddressItems.isNotEmpty;

    return anyStoreSelected || anyAddressSelected || anyItemsSelected;
  }

  @action
  @action
  void updateCheckBox({
    required int index,
    int? branchIndex,
    bool isAddress = false,
  }) {
    if (!isAddress) {
      // For shop-level checkboxes
      checkBoxValues[index] = !checkBoxValues[index];
      if (checkBoxValues[index]) {
        checkedStoreItems.add({shops[index].id: shops[index].name});
      } else {
        checkedStoreItems
            .removeWhere((element) => element.containsKey(shops[index].id));
      }
    } else {
      int addressIndex =
          index * shopsUnitModelList[index].branch.length + branchIndex!;
      addressCheckBoxValues[addressIndex] =
          !addressCheckBoxValues[addressIndex];

      if (addressCheckBoxValues[addressIndex]) {
        checkedAddressItems.add({
          shopsUnitModelList[index].uniqueID:
              "${shopsUnitModelList[index].branch[branchIndex].street}, ${shopsUnitModelList[index].branch[branchIndex].city}"
        });
      } else {
        checkedAddressItems.removeWhere((element) =>
            element.containsKey(shopsUnitModelList[index].uniqueID));
      }
    }

    checkForButtonEnable();
  }

  void checkForButtonEnable() {
    isAnyCheckBoxSelected;
  }

  @action
  void checkBoxReset({bool isAddress = false}) {
    if (isAddress) {
      for (int i = 0; i < checkBoxValues.length; i++) {
        checkBoxValues[i] = false;
      }
      checkedStoreItems = [];
    } else {
      for (int i = 0; i < addressCheckBoxValues.length; i++) {
        addressCheckBoxValues[i] = false;
      }
      checkedAddressItems = [];
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
      int addressCount = 0;
      for (var shopItem in shopsUnitModelList) {
        addressCount += shopItem.branch.length;
      }
      addressCheckBoxValues =
          ObservableList<bool>.of(List<bool>.filled(addressCount, false));
    }).then(
      (data) {},
      onError: (error) {
        getError = error;
      },
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
