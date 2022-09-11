
import 'package:alura_challenge_mobile/app/data/providers/expense_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:alura_challenge_mobile/app/modules/expense/controllers/expense_controller.dart';
import 'package:get/get.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    ExpenseProvider expenseProvider = ExpenseProvider();
    TypeIncomeProvider typeIncomeProvider = TypeIncomeProvider();
    Get.lazyPut<ExpenseController>(() => ExpenseController(expenseProvider, typeIncomeProvider));
  }
}
