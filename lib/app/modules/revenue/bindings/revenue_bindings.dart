
import 'package:alura_challenge_mobile/app/data/providers/revenue_provider.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:get/get.dart';

class RevenueBinding extends Bindings {
  @override
  void dependencies() {
    RevenueProvider revenueProvider = RevenueProvider();
    Get.lazyPut<RevenueController>(() => RevenueController(revenueProvider));
  }
}
