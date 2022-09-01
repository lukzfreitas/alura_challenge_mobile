// import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/user_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class SessionProvider extends GetConnect {
  static const baseurl = 'https://challenge-backend-lukz.herokuapp.com/login';

  final prefs = UserPreferences();

  String _error = '';

  String get error => _error;

  Future<bool> signInProvider(String username, String password) async {
    Response response = await post(
      baseurl,
      {
        "username": username,
        "password": password,
      },
    );
    if (response.isOk) {
      var user = UserModel.fromJson(response.body);
      await prefs.deleteUser();
      await prefs.setUser(user);
      return true;
    } else {
      _error = response.statusText.toString();
      return false;
    }    
  }
}
