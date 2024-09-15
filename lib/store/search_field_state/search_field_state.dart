// search_field_state.dart
import 'package:denari_app/data/transactions/model/transaction_receive_model.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:mobx/mobx.dart';
part 'search_field_state.g.dart';

class SearchFieldState = ImplSearchFieldState with _$SearchFieldState;

abstract class ImplSearchFieldState with Store {
  @observable
  bool showCancel = false;

  @observable
  bool showSuggestion = false;

  @observable
  ObservableList<dynamic> filteredSuggestions =
      ObservableList<dynamic>();

  @action
  void filterSuggestions(String query, List<dynamic> searchList) {
    if (query.isEmpty) {
      filteredSuggestions = ObservableList<dynamic>();
    } else {
      filteredSuggestions = ObservableList<dynamic>.of(
        searchList.where(
              (item) => item.shop.name.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

}
