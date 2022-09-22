import 'package:alura_challenge_mobile/app/core/utils/currency_format.dart';
import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/income_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class IncomeController extends GetxController {

  final _formKey = GlobalKey<FormState>().obs;
  GlobalKey<FormState> get formKey => _formKey.value;

  final _descriptionController = TextEditingController().obs;
  TextEditingController get descriptionController =>
      _descriptionController.value;

  final _amountController = TextEditingController().obs;
  TextEditingController get amountController => _amountController.value;

  final typeIncomeId = ''.obs;

  String? validatorDescription() {
    if (descriptionController.text.isEmpty) {
      return 'Please enter some description text';
    }
    return null;
  }

  String? validatorAmount() {
    if (amountController.text.isEmpty) {
      return 'Please enter some amount';
    }    
    int amount = CurrencyInputFormatter.convertToInteger(amountController.value.text);
    if (amount == 0) {
      return 'Plese enter amount more than zero';
    }
    return null;
  }

  String? validatorTypeIncome() {
    if (typeIncomeId.isEmpty) {
      return 'Plese select at least one type income';
    }
    return null;
  }

  openIncome(IncomeModel income) {
    descriptionController.text = income.description;
    amountController.text = CurrencyFormat.currencyFormat(amount: income.money.amount, symbol: 'R\$ ');
    typeIncomeId.value = income.typeIncome.toString(); 
  }
}
