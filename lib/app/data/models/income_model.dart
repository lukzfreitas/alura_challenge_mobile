import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class IncomeModel {
  String description;
  Money money;
  String date;
  IncomeModel({
    required this.description,
    required this.money,
    required this.date,
  });

  IncomeModel copyWith({
    String? description,
    Money? money,
    String? date,
  }) {
    return IncomeModel(
      description: description ?? this.description,
      money: money ?? this.money,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'money': money.toMap(),
      'date': date,
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomeModel.fromJson(String source) =>
      IncomeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'IncomeModel(description: $description, money: $money, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IncomeModel &&
        other.description == description &&
        other.money == money &&
        other.date == date;
  }

  @override
  int get hashCode => description.hashCode ^ money.hashCode ^ date.hashCode;
}
