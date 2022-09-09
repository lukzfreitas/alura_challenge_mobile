
import 'package:intl/intl.dart';

class DatetimeFormat {
  static String dateFormat({required String date, format = "dd/MM/yyyy"}) {
    return DateFormat(format).format(DateTime.parse(date)).toString();
  }
}
