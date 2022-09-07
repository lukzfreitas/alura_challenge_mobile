import 'package:alura_challenge_mobile/app/data/models/user_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SessionProvider extends GetConnect {
  static const baseurl = 'https://challenge-backend-lukz.herokuapp.com/auth';
  static const login = '/login';
  static const logout = '/logout';

  final prefs = UserPreferences();

  String _error = '';

  String get error => _error;

  Future<bool> signInProvider(String username, String password) async {
    Response response = await post(
      "$baseurl$login",
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
    }
    _error = response.statusText.toString();
    return false;
  }

  Future<bool> signOutProvider() async {    
    String token = await prefs.getToken();    
    Map<String, dynamic> user = JwtDecoder.decode(token.toString());    
    Response response = await post(
      "$baseurl$logout",
      {
        "username": user['username']
      },
      headers: {'Authorization': "Bearer $token"},
    );
    if (response.isOk) {
      await prefs.deleteUser();
      return true;
    } 
    _error = response.statusText.toString();
    return false;
  }
}
