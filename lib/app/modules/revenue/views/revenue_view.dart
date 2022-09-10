import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';
import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/dropdown.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RevenueView extends GetView<RevenueController> {
  const RevenueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receitas')),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 7.0,
            vertical: 20.0,
          ),
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
              FutureBuilder<List<DropdownItem>>(
                  future: controller.listTypeIncomeController(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {                    
                    if (snapshot.hasData) {
                      return Dropdown(items: snapshot.data);
                    } else {
                      return const Text('Carregando');
                    }
                  }),
              const SizedBox(height: 20.0),
              Button(
                text: 'Salvar',
                onClick: () async => await controller.revenueController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
