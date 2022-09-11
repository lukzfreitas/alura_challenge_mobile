import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class IncomeController extends GetxController {
  final _descriptionController = TextEditingController().obs;
  TextEditingController get descriptionController =>
      _descriptionController.value;

  final _amountController = TextEditingController().obs;
  TextEditingController get amountController => _amountController.value;

  final typeIncomeId = ''.obs;
}
