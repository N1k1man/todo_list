String formatDate(DateTime dateTime) {
  final day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
  final month =
      dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
  final year = dateTime.year;

  return '$day.$month.$year';
}
