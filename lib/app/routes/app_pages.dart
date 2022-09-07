import 'package:alura_challenge_mobile/app/modules/home/bindings/home_bindings.dart';
import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;  

  static logout() async {    
    Get.offAndToNamed(Routes.login);
  }

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
