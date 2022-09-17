import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';
import 'package:alura_challenge_mobile/app/data/models/expense_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';
import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/expense_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:alura_challenge_mobile/app/modules/income/controllers/income_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseController extends IncomeController implements GetxController {
  ExpenseProvider expenseProvider;

  TypeIncomeProvider typeIncomeProvider;

  ExpenseController(this.expenseProvider, this.typeIncomeProvider);

  final _categoryController = TextEditingController().obs;
  TextEditingController get categoryController => _categoryController.value;

  Future<bool> expenseController() async {
    if (formKey.currentState!.validate()) {
      int amount =
          CurrencyInputFormatter.convertToInteger(amountController.value.text);
      ExpenseModel expenseModel = ExpenseModel(
        description: descriptionController.value.text,
        money: Money(amount: amount, currency: 'BRL'),
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),        
        typeIncome: typeIncomeId.value,
      );
      return expenseProvider.expenseProvider(expenseModel);
    }
    return false;
  }

  Future<List<DropdownItem>> listTypeIncomeController() async {
    List<TypeIncome> list = await typeIncomeProvider.listTypeIncomeProvider();
    List<DropdownItem> listDropdownItem = [];
    for (var element in list) {
      listDropdownItem.add(DropdownItem(element.id ?? '', element.description));
    }
    return listDropdownItem;
  }
}
