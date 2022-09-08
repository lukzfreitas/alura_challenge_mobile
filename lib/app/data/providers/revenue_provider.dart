import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class RevenueProvider extends GetConnect {
  final prefs = UserPreferences();

  static const baseurl = 'https://challenge-backend-lukz.herokuapp.com/revenue';

  Future<bool> revenueProvider(RevenueModel revenueModel) async {
    String token = await prefs.getToken();
    Response response = await post(
      baseurl,
      revenueModel.toJson(),
      headers: {'Authorization': "Bearer $token"},
    );
    return response.isOk;
  }
}
