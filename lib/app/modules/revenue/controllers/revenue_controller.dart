import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';
import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/revenue_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RevenueController extends GetxController {
  RevenueProvider revenueProvider;

  RevenueController(this.revenueProvider);

  final _descriptionController = TextEditingController().obs;
  TextEditingController get descriptionController =>
      _descriptionController.value;

  final _amountController = TextEditingController().obs;
  TextEditingController get amountController => _amountController.value;

  Future<bool> revenueController() async {
    int amount =
        CurrencyInputFormatter.convertToInteger(amountController.value.text);
    RevenueModel revenueModel = RevenueModel(
      description: descriptionController.value.text,
      money: Money(amount: amount, currency: 'BRL'),
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    return revenueProvider.revenueProvider(revenueModel);
  }
}
