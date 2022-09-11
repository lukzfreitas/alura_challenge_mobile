import 'package:alura_challenge_mobile/app/data/models/income_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';

class RevenueModel extends IncomeModel {
  RevenueModel({
    required super.description,
    required super.money,
    required super.date,
    super.typeIncome
  });

  factory RevenueModel.fromMap(Map<String, dynamic> map) {
    return RevenueModel(
      description: map['description'] ?? '',
      money: Money.fromMap(map['money']),
      date: map['date'] ?? '',
      typeIncome: map['typeIncome'] ?? '',
    );
  }
}
