import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class RevenueModel {
  String description;
  Money money;
  String date;
  RevenueModel({
    required this.description,
    required this.money,
    required this.date,
  });

  RevenueModel copyWith({
    String? description,
    Money? money,
    String? date,
  }) {
    return RevenueModel(
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

  factory RevenueModel.fromMap(Map<String, dynamic> map) {
    return RevenueModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RevenueModel.fromJson(String source) => RevenueModel.fromMap(json.decode(source));

  @override
  String toString() => 'RevenueModel(description: $description, money: $money, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RevenueModel &&
      other.description == description &&
      other.money == money &&
      other.date == date;
  }

  @override
  int get hashCode => description.hashCode ^ money.hashCode ^ date.hashCode;
}
