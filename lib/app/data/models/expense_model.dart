import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/income_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class ExpenseModel extends IncomeModel {

  int category;
  ExpenseModel({
    required super.description,
    required super.money,
    required super.date,
    required this.category,
    super.typeIncome
  });  

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
      category: map['category']?.toInt() ?? 0,      
      typeIncome: map['typeIncome'] ?? '',
    );
  }

  @override
  String toJson() {
    Map<String, dynamic> map = toMap();
    map['category'] = category;
    return json.encode(map);
  }

  factory ExpenseModel.fromJson(String source) => ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExpenseModel(description: $description, money: $money, date: $date, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExpenseModel &&
      other.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}
