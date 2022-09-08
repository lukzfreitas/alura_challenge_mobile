import 'package:alura_challenge_mobile/app/data/models/expense_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class ExpenseProvider extends GetConnect {
  final prefs = UserPreferences();

  static const baseurl = 'https://challenge-backend-lukz.herokuapp.com/expense';

  Future<bool> expenseProvider(ExpenseModel expenseModel) async {
    String token = await prefs.getToken();
    Response response = await post(
      baseurl,
      expenseModel.toJson(),
      headers: {'Authorization': "Bearer $token"},
    );
    return response.isOk;
  }
}
