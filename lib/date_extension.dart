import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get formatter => DateFormat.yMMMEd().format(this);
}