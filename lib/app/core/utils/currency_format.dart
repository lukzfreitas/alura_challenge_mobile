import 'package:intl/intl.dart';

class CurrencyFormat {
  static String currencyFormat(
      {required int amount, String locale = 'en_US', String symbol = '\$'}) {
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2,
    ).format(amount * 0.01);
  }
}
