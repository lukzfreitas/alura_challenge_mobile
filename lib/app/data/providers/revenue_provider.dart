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

  Future<List<RevenueModel>> listRevenueProvider(int month, int year) async {
    String token = await prefs.getToken();
    String url = "$baseurl/$year/$month";
    Response response = await get(
      url,
      headers: {'Authorization': "Bearer $token"},
    );
    List<RevenueModel> listRevenue = [];
    if (response.isOk) {
      List<dynamic> list = response.body;
      for (var element in list) {
        listRevenue.add(RevenueModel.fromMap(element));
      }
      return listRevenue;
    }
    return [];
  }
}
