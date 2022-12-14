import 'package:alura_challenge_mobile/app/modules/expense/bindings/expense_binding.dart';
import 'package:alura_challenge_mobile/app/modules/expense/bindings/list_expense_binding.dart';
import 'package:alura_challenge_mobile/app/modules/expense/views/expense_view.dart';
import 'package:alura_challenge_mobile/app/modules/expense/views/list_expense_view.dart';
import 'package:alura_challenge_mobile/app/modules/home/bindings/home_bindings.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/bindings/revenue_binding.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/views/list_revenue_view.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/views/revenue_view.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/bindings/list_type_income_binding.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/bindings/type_income_binding.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/views/list_type_income_view.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/views/type_income_view.dart';
import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static logout() async {
    Get.offAndToNamed(Routes.login);
  }

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.revenue,
      page: () => const RevenueView(),
      binding: RevenueBinding(),
    ),
    GetPage(
      name: _Paths.revenueList,
      page: () => const ListRevenueView(),
      binding: RevenueBinding(),
    ),
    GetPage(
      name: _Paths.expense,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: _Paths.expenseList,
      page: () => const ListExpenseView(),
      binding: ListExpenseBinding()
      ),
    GetPage(
      name: _Paths.typeIncome,
      page: () => const TypeIncomeView(),
      binding: TypeIncomeBinding(),
    ),
    GetPage(
      name: _Paths.typeIncomeList,
      page: () => const ListTypeIncomeView(),
      binding: ListTypeIncomeBinding(),
    ),
  ];
}
