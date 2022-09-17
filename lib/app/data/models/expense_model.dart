import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/income_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class ExpenseModel extends IncomeModel {
  ExpenseModel(
      {required super.description,
      required super.money,
      required super.date,
      super.typeIncome});

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
      typeIncome: map['typeIncome'] ?? '',
    );
  }

  @override
  String toJson() {
    Map<String, dynamic> map = toMap();
    return json.encode(map);
  }

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExpenseModel(description: $description, money: $money, date: $date, type income: $typeIncome)';  
}
