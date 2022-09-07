
import 'package:alura_challenge_mobile/app/data/providers/extract_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:alura_challenge_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    ExtractProvider extractProvider = ExtractProvider();
    SessionProvider sessionProvider = SessionProvider();
    Get.lazyPut<HomeController>(() => HomeController(extractProvider, sessionProvider));
  }
}
