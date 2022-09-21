import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/data/preferences/user_preferences.dart';
import 'package:get/get.dart';

class TypeIncomeProvider extends GetConnect {
  final prefs = UserPreferences();

  static const baseurl =
      'https://challenge-backend-lukz.herokuapp.com/type-income';

  Future<bool> createTypeIncomeProvider(TypeIncome typeIncome) async {
    String token = await prefs.getToken();
    Response response = await post(
      baseurl,
      typeIncome.toJson(),
      headers: {'Authorization': "Bearer $token"},
    );
    return response.isOk;
  }

  Future<bool> updateTypeIncomeProvider(TypeIncome typeIncome) async {
    String token = await prefs.getToken();
    Response response = await put(
      '$baseurl/${typeIncome.id}',
      typeIncome.toJson(),
      headers: {'Authorization': "Bearer $token"},
    );
    return response.isOk;
  }

  Future<List<TypeIncome>> listTypeIncomeProvider() async {
    String token = await prefs.getToken();
    Response response = await get(
      baseurl,
      headers: {'Authorization': "Bearer $token"},
    );
    List<TypeIncome> listTypeIncome = [];
    if (response.isOk) {
      List<dynamic> list = response.body;
      for (var element in list) {
        listTypeIncome.add(TypeIncome.fromMap(element));
      }
      return listTypeIncome;
    }
    return [];
  }

  Future<bool> deleteTypeIncomeProvider(int code) async {
    String token = await prefs.getToken();
    Response response = await delete(
      "$baseurl/$code",
      headers: {'Authorization': "Bearer $token"},
    );
    return response.isOk;
  }
}
