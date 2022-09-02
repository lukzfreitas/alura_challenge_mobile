import 'dart:convert';

class ExtractModel {
  int totalRevenue;
  int totalExpense;
  int balance;  
  ExtractModel({
    required this.totalRevenue,
    required this.totalExpense,
    required this.balance,
  });

  ExtractModel copyWith({
    int? totalRevenue,
    int? totalExpense,
    int? balance,
  }) {
    return ExtractModel(
      totalRevenue: totalRevenue ?? this.totalRevenue,
      totalExpense: totalExpense ?? this.totalExpense,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalRevenue': totalRevenue,
      'totalExpense': totalExpense,
      'balance': balance,
    };
  }

  factory ExtractModel.fromMap(Map<String, dynamic> map) {
    return ExtractModel(
      totalRevenue: map['totalRevenue']?.toInt() ?? 0,
      totalExpense: map['totalExpense']?.toInt() ?? 0,
      balance: map['balance']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtractModel.fromJson(String source) => ExtractModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExtractModel(totalRevenue: $totalRevenue, totalExpense: $totalExpense, balance: $balance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExtractModel &&
      other.totalRevenue == totalRevenue &&
      other.totalExpense == totalExpense &&
      other.balance == balance;
  }

  @override
  int get hashCode => totalRevenue.hashCode ^ totalExpense.hashCode ^ balance.hashCode;
}
