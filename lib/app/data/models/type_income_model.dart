import 'dart:convert';

class TypeIncome {
  String id;
  String description;
  int code;
  TypeIncome({
    required this.id,
    required this.description,
    required this.code,
  });

  TypeIncome copyWith({
    String? id,
    String? description,
    int? code,
  }) {
    return TypeIncome(
      id: id ?? this.id,
      description: description ?? this.description,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'description': description,
      'code': code,
    };
  }

  factory TypeIncome.fromMap(Map<String, dynamic> map) {
    return TypeIncome(
      id: map['_id'] ?? '',
      description: map['description'] ?? '',
      code: map['code']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeIncome.fromJson(String source) => TypeIncome.fromMap(json.decode(source));

  @override
  String toString() => 'TypeIncome(id: $id, description: $description, code: $code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TypeIncome &&
      other.id == id && 
      other.description == description &&
      other.code == code;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ code.hashCode;
}
