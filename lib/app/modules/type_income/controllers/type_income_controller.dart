import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TypeIncomeController extends GetxController {
  TypeIncomeProvider typeIncomeProvider;

  TypeIncomeController(this.typeIncomeProvider);

  final _descriptionController = TextEditingController().obs;
  TextEditingController get descriptionController =>
      _descriptionController.value;

  final _codeController = TextEditingController().obs;
  TextEditingController get codeController => _codeController.value;

  Future<List<TypeIncome>> listTypeIncomeController() async {
    return typeIncomeProvider.listTypeIncomeProvider();
  }

  Future<bool> createTypeIncomeController() async {
    return typeIncomeProvider.createTypeIncomeProvider(
      TypeIncome(
        description: descriptionController.value.text,
        code: int.parse(codeController.value.text),
      ),
    );
  }
}
