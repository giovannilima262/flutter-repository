import 'package:intl/intl.dart';

class FormatDate {
  FormatDate._();

  static String jsonToFormatString(value) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(value);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
