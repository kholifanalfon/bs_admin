part of helpers;

String notNull(dynamic value, {String? nullValue}) {
  return value == null ? nullValue != null ? nullValue : '' : value.toString();
}

double parseDouble(dynamic value, {int decimal = 2}) {
  return value == null ? 0.0 : double.parse(value.toString());
}

int parseInt(dynamic value) {
  return value == null ? 0 : int.parse(value.toString());
}

String parseString(dynamic value) {
  return value == null ? '' : value.toString();
}

DateTime? parseDate(dynamic value) {
  return value == null ? null : DateTime.parse(value.toString());
}