import 'package:easy_localization/easy_localization.dart';

/// Display-oriented helpers. All parsers are total: on malformed input they
/// return the input unchanged (or [fallback]) instead of throwing, because
/// these run on server-provided strings in release builds.
String formatDate(String dateTimeString, {String? fallback}) {
  final dateTime = DateTime.tryParse(dateTimeString);
  if (dateTime == null) return fallback ?? dateTimeString;
  return DateFormat('yyyy-MM-dd', 'en').format(dateTime);
}

String formatDate2(String dateTimeString, {String? fallback}) {
  try {
    final inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final dateTime = inputFormat.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } catch (_) {
    return fallback ?? dateTimeString;
  }
}

String formatTime(String dateTimeString, {String? fallback}) {
  final dateTime = DateTime.tryParse(dateTimeString);
  if (dateTime == null) return fallback ?? dateTimeString;
  return DateFormat('HH:mm', 'en').format(dateTime);
}

DateTime formatTimeDateTime(String dateTimeString, {DateTime? fallback}) {
  return DateTime.tryParse(dateTimeString) ?? fallback ?? DateTime.now();
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('HH:mm:ss').format(now);

  return formattedTime;
}