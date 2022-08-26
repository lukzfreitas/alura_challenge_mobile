import 'dart:convert';

import 'package:alura_challenge_mobile/app/data/models/user_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class SessionProvider {
  final request = Dio();  

  static const BASE_URL = 'https://challenge-backend-lukz.herokuapp.com/login';

  final prefs = UserPreferences();

  String _error = '';
  String get error => _error;

  Future<bool> singInProvider(String username, String password) async {
    try {
      final opt = Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {'Content-Type': 'application/json'},
      );
      final response = await request.post(
        BASE_URL,
        options: opt,
        data: jsonEncode({username: username, password: password}),
      );
      if (response.statusCode == 201) {
        var jwtCode = response.data['access_token'];

        // await prefs.deleteUser();
        // await prefs.setUser(user);
        return true;
      } else {
        _error = 'error';
        return false;
      }
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
