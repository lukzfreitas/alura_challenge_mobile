import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/expense_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/expense_provider.dart';
import 'package:alura_challenge_mobile/app/modules/income/controllers/income_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseController extends IncomeController implements GetxController {
  ExpenseProvider expenseProvider;

  ExpenseController(this.expenseProvider);  

  final _categoryController = TextEditingController().obs;
  TextEditingController get categoryController => _categoryController.value;

  Future<bool> expenseController() async {
    int amount =
        CurrencyInputFormatter.convertToInteger(amountController.value.text);
    ExpenseModel expenseModel = ExpenseModel(
      description: descriptionController.value.text,
      money: Money(amount: amount, currency: 'BRL'),
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      category: int.parse(categoryController.value.text), 
    );
    return expenseProvider.expenseProvider(expenseModel);
  }
}
