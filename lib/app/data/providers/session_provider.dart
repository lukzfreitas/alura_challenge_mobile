import 'package:http/http.dart' as http;

class SessionProvider {
  static const LOGIN = '/login';

  static const BASE_URL = 'challenge-backend-lukz.herokuapp.com';

  String _error = '';
  String get error => _error;

  Future<bool> singInProvider(String username, String password) async {
    try {
      final response = await http.post(
        Uri.https(BASE_URL, LOGIN),
        headers: {"Accept": "application/json"},
        body: {username: username, password: password},
      );
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
