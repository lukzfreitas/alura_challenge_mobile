class UserModel {
  String? token;
  String? refreshToken;

  UserModel({this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = token;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
