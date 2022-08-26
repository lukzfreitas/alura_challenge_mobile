import 'dart:convert';

class UserModel {
  String? email;
  String? token;
  UserModel({
    this.email,
    this.token,
  });

  UserModel copyWith({
    String? email,
    String? token,
  }) {
    return UserModel(
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.token == token;
  }

  @override
  int get hashCode => email.hashCode ^ token.hashCode;
}
