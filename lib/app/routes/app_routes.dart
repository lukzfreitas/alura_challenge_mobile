part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const revenue = _Paths.revenue;
  static const revenueList = _Paths.revenueList;
  static const expense = _Paths.expense;
  static const expenseList = _Paths.expenseList;
  static const typeIncome = _Paths.typeIncome;
  static const typeIncomeList = _Paths.typeIncomeList;
}

abstract class _Paths {
  _Paths._();
  static const login = '/login';
  static const home = '/home';
  static const revenue = '/revenue';
  static const revenueList = '/revenue-list';
  static const expense = '/expense';
  static const expenseList = '/expense-list';
  static const typeIncome = '/type-income';
  static const typeIncomeList = '/type-income-list';
}