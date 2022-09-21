import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TypeIncomeController extends GetxController {
  TypeIncomeProvider typeIncomeProvider;

  TypeIncomeController(this.typeIncomeProvider);

  var id = ''.obs;

  final _descriptionController = TextEditingController().obs;
  TextEditingController get descriptionController =>
      _descriptionController.value;

  final _codeController = TextEditingController().obs;
  TextEditingController get codeController => _codeController.value;

  Future<List<TypeIncome>> listTypeIncomeController() async {
    return typeIncomeProvider.listTypeIncomeProvider();
  }

  @override
  onInit() {
    id.value = Get.parameters['_id'].toString();
    codeController.text = Get.parameters['code'].toString();
    descriptionController.text = Get.parameters['description'].toString();
    super.onInit();
  }

  Future<bool> createTypeIncomeController() async {
    if (id.value == '') {
      return typeIncomeProvider.createTypeIncomeProvider(
        TypeIncome(
          description: descriptionController.value.text,
          code: int.parse(codeController.value.text),
        ),
      );
    }
    return typeIncomeProvider.updateTypeIncomeProvider(
      TypeIncome(
        id: id.value,
        description: descriptionController.value.text,
        code: int.parse(codeController.value.text),
      ),
    );
  }
}
