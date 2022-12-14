import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';
import 'package:alura_challenge_mobile/app/data/models/money_model.dart';
import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/revenue_provider.dart';
import 'package:alura_challenge_mobile/app/data/providers/type_income_provider.dart';
import 'package:alura_challenge_mobile/app/modules/income/controllers/income_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RevenueController extends IncomeController implements GetxController {
  RevenueProvider revenueProvider;

  TypeIncomeProvider typeIncomeProvider;

  RevenueController(this.revenueProvider, this.typeIncomeProvider);

  var month = DateTime.now().month.obs;

  var year = DateTime.now().year.obs;

  Future<bool> revenueController() async {
    if (formKey.currentState!.validate()) {
      int amount =
          CurrencyInputFormatter.convertToInteger(amountController.value.text);
      RevenueModel revenueModel = RevenueModel(
        description: descriptionController.value.text,
        money: Money(amount: amount, currency: 'BRL'),
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        typeIncome: typeIncomeId.value,
      );      
      return revenueProvider.revenueProvider(revenueModel);
    }
    return false;
  }

  Future<List<RevenueModel>> listRevenueController() async {
    return await revenueProvider.listRevenueProvider(month.value, year.value);    
  }

  Future<List<DropdownItem>> listTypeIncomeController() async {
    List<TypeIncome> list = await typeIncomeProvider.listTypeIncomeProvider();
    List<DropdownItem> listDropdownItem = [];
    for (var element in list) {
      listDropdownItem.add(DropdownItem(element.id ?? '', element.description));
    }
    return listDropdownItem;
  }
}
