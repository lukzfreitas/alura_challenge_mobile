import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class IncomeModel {
  String description;
  Money money;
  String date;
  String? typeIncome;
  IncomeModel({
    required this.description,
    required this.money,
    required this.date,
    this.typeIncome
  });

  IncomeModel copyWith({
    String? description,
    Money? money,
    String? date,
    String? typeIncome,
  }) {
    return IncomeModel(
      description: description ?? this.description,
      money: money ?? this.money,
      date: date ?? this.date,
      typeIncome: typeIncome ?? this.typeIncome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'money': money.toMap(),
      'date': date,
      'typeIncome': typeIncome,
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
      typeIncome: map['typeIncome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomeModel.fromJson(String source) => IncomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IncomeModel(description: $description, money: $money, date: $date, typeIncome: $typeIncome)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is IncomeModel &&
      other.description == description &&
      other.money == money &&
      other.date == date &&
      other.typeIncome == typeIncome;
  }

  @override
  int get hashCode {
    return description.hashCode ^
      money.hashCode ^
      date.hashCode ^
      typeIncome.hashCode;
  }
}
