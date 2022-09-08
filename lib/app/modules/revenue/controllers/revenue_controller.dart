import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';
import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/revenue_provider.dart';
import 'package:alura_challenge_mobile/app/modules/income/controllers/income_controller.dart';
import 'package:intl/intl.dart';

class RevenueController extends IncomeController {
  RevenueProvider revenueProvider;

  RevenueController(this.revenueProvider);  

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
