import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String get timeFormat {
    if (this == null) return '';
    return DateFormat('hh:mm a').format(this!);
  }

  String get dateFormat {
    if (this == null) return '';
    return DateFormat('yyyy-MM-dd').format(this!);
  }
}
