import 'dart:convert';

class Money {
  int amount;
  String currency;
  Money({
    required this.amount,
    required this.currency,
  });

  Money copyWith({
    int? amount,
    String? currency,
  }) {
    return Money(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }

  factory Money.fromMap(Map<String, dynamic> map) {
    return Money(
      amount: map['amount']?.toInt() ?? 0,
      currency: map['currency'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Money.fromJson(String source) => Money.fromMap(json.decode(source));

  @override
  String toString() => 'Money(amount: $amount, currency: $currency)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Money &&
      other.amount == amount &&
      other.currency == currency;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
