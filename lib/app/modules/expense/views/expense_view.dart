import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';
import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/dropdown.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/expense/controllers/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas')),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth / 7.0, vertical: 20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                FutureBuilder<List<DropdownItem>>(
                  future: controller.listTypeIncomeController(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Dropdown(
                        hintText: 'Selecione o tipo da despesa',
                        items: snapshot.data,
                        onChanged: (DropdownItem item) {
                          controller.typeIncomeId.value = item.id;
                        },
                        validator: controller.validatorTypeIncome,
                      );
                    } else {
                      return const Text('Carregando');
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                Input(
                  hintText: 'Informe uma descrição',
                  controller: controller.descriptionController,
                  validator: controller.validatorDescription,
                ),
                const SizedBox(height: 20.0),
                Input(
                  hintText: 'Informe o valor',
                  controller: controller.amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter()
                  ],
                  validator: controller.validatorAmount,
                ),
                const SizedBox(height: 20.0),
                Button(
                  text: 'Salvar',
                  onClick: () async => await controller.expenseController(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
