import 'dart:convert';

class TypeIncome {
  String description;
  int code;
  TypeIncome({
    required this.description,
    required this.code,
  });

  TypeIncome copyWith({
    String? description,
    int? code,
  }) {
    return TypeIncome(
      description: description ?? this.description,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'code': code,
    };
  }

  factory TypeIncome.fromMap(Map<String, dynamic> map) {
    return TypeIncome(
      description: map['description'] ?? '',
      code: map['code']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeIncome.fromJson(String source) => TypeIncome.fromMap(json.decode(source));

  @override
  String toString() => 'TypeIncome(description: $description, code: $code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TypeIncome &&
      other.description == description &&
      other.code == code;
  }

  @override
  int get hashCode => description.hashCode ^ code.hashCode;
}
