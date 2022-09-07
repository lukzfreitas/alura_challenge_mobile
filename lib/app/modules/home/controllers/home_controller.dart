import 'package:alura_challenge_mobile/app/data/models/extract_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/extract_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  ExtractProvider extractProvider;
  SessionProvider sessionProvider;

  HomeController(this.extractProvider, this.sessionProvider);  

  Future<ExtractModel> extractController() async {
    DateTime dateNow = DateTime.now();
    return await extractProvider.extractProvider(dateNow.month, dateNow.year);    
  }

  Future<void> logoutController() async {
    bool isLogout = await sessionProvider.signOutProvider();
    if (isLogout) {
      AppPages.logout();
    }
  }
}