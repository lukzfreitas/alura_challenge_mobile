import 'package:alura_challenge_mobile/app/data/models/extract_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class ExtractProvider extends GetConnect {
  final prefs = UserPreferences();

  static const baseurl = 'https://challenge-backend-lukz.herokuapp.com/extract';

  Future<ExtractModel> extractProvider(int month, int year) async {
    String token = await prefs.getToken();
    Response response = await get('$baseurl/$year/$month',
        headers: {'Authorization': "Bearer $token"});

    if (response.isOk) {
      ExtractModel extractModel = ExtractModel.fromMap(response.body);
      return extractModel;
    }
    return ExtractModel(totalRevenue: 0, totalExpense: 0, balance: 0);
  }
}
