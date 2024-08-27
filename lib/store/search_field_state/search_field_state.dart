// search_field_state.dart
import 'package:mobx/mobx.dart';

part 'search_field_state.g.dart';

class SearchFieldState = ImplSearchFieldState with _$SearchFieldState;

abstract class ImplSearchFieldState with Store {
  @observable
  bool showCancel = false;

  @observable
  bool showSuggestion = false;

  @observable
  ObservableList<String> filteredSuggestions = ObservableList<String>();

  @action
  void filterSuggestions(String query, List<String> searchList) {
    if (query.isEmpty) {
      filteredSuggestions = ObservableList<String>();
    } else {
      filteredSuggestions = ObservableList<String>.of(
        searchList.where(
              (item) => item.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }
}
