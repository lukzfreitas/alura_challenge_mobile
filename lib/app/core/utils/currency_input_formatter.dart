import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ ${formatter.format(value / 100)}";

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }

  static convertToInteger(String currencyFormated) {
    String value = currencyFormated.replaceAll("R\$", "");
    value = value.replaceAll(",", "");
    value = value.replaceAll(" ", "");
    return int.parse(value);
  }
}
