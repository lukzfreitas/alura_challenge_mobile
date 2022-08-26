import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserPreferences {
  UserPreferences();

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    String email = prefs.getString("email") ?? '';
    String token = prefs.getString("token") ?? '';    

    return UserModel(      
      email: email,
      token: token,    
    );
  }

  Future<void> setUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString('email', user.email ?? '');
    prefs.setString('token', user.token ?? '');
  }

  Future<void> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("token") ?? '';
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("email") ?? '';
  }
}
