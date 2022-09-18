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

  Future<List<ExpenseModel>> listExpenseProvider(int month, int year) async {
    String token = await prefs.getToken();
    String url = "$baseurl/$year/$month";
    Response response = await get(
      url,
      headers: {'Authorization': "Bearer $token"},
    );
    List<ExpenseModel> listRevenue = [];
    if (response.isOk) {
      List<dynamic> list = response.body;
      for (var element in list) {
        listRevenue.add(ExpenseModel.fromMap(element));
      }
      return listRevenue;
    }
    return [];
  }
}
