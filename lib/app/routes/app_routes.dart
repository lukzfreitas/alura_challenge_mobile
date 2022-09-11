part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const revenue = _Paths.revenue;
  static const revenueList = _Paths.revenueList;
  static const expense = _Paths.expense;
  static const typeIncome = _Paths.typeIncome;
}

abstract class _Paths {
  _Paths._();
  static const login = '/login';
  static const home = '/home';
  static const revenue = '/revenue';
  static const revenueList = '/revenue-list';
  static const expense = '/expense';
  static const typeIncome = '/type-income';
}