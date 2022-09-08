
import 'package:alura_challenge_mobile/app/modules/deposit/controllers/deposit_controller.dart';
import 'package:get/get.dart';

class DepositBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<DepositController>(() => DepositController());
  }
}
