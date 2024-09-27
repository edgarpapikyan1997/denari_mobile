import 'package:denari_app/utils/extensions/extensions.dart';

extension DateTimeExt on DateTime {
  String print() => DateFormat('yyyy-MM-dd', 'ru_RU').format(this);
}
