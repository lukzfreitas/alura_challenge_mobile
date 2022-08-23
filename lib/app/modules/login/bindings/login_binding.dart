import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:alura_challenge_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    SessionProvider sessionProvider = SessionProvider();
    Get.lazyPut<LoginController>(() => LoginController(sessionProvider));
  }
}
