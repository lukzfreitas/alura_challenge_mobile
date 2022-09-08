import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
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
          child: Column(
            children: [
              Input(
                hintText: 'Informe uma descrição',
                controller: controller.descriptionController,
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
              ),
              const SizedBox(height: 20.0),
              Input(
                hintText: 'Informe a categoria',
                controller: controller.categoryController,
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
    );
  }
}
