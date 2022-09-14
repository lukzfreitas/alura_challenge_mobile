import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/controllers/type_income_controller.dart';
import 'package:get/get.dart';

class TypeIncomeBinding extends Bindings {
  @override
  void dependencies() {
    TypeIncomeProvider typeIncomeProvider = TypeIncomeProvider();    
    Get.lazyPut<TypeIncomeController>(() => TypeIncomeController(typeIncomeProvider));
  }
}
