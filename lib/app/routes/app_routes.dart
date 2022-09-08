part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const revenue = _Paths.revenue;
  static const expense = _Paths.expense;
}

abstract class _Paths {
  _Paths._();
  static const login = '/login';
  static const home = '/home';
  static const revenue = '/revenue';
  static const expense = '/expense';
}