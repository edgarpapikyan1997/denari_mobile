import 'package:intl_phone_field/phone_number.dart';

extension PhoneNumberExt on PhoneNumber? {
  String print() {
    String number = this?.completeNumber ?? '';
    if (!number.startsWith('+')) {
      number = '+$number';
    }
    return number;
  }
}