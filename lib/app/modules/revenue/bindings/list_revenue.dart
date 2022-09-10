import 'package:alura_challenge_mobile/app/data/providers/revenue_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:get/get.dart';

class ListRevenueBinding extends Bindings {
  @override
  void dependencies() {
    RevenueProvider revenueProvider = RevenueProvider();
    TypeIncomeProvider typeIncomeProvider = TypeIncomeProvider();
    Get.lazyPut<RevenueController>(() => RevenueController(revenueProvider, typeIncomeProvider));
  }
}
