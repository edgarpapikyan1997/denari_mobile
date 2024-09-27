import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:mobx/mobx.dart';

part 'date_picker_state.g.dart';

class DatePickerState = ImplDatePickerState with _$DatePickerState;

abstract class ImplDatePickerState with Store {
  @observable
  DateTime? startDate;

  @observable
  DateTime? endDate;

  @observable
  List<String> branches = [];

  @action
  void setStartDate(
    DateTime newValue,
  ) {
    startDate = newValue;
  }

  @action
  void setEndDate(
    DateTime newValue,
  ) {
    endDate = newValue;
  }

  void resetDate(String? defaultStart, String? defaultEnd) {
    if (defaultStart != null) {
      startDate = defaultStart.toDate();
      endDate = null;
    }
  }
}
