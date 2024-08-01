extension StringExt on String? {
  DateTime? toDate() => DateTime.tryParse(this ?? '');
}
