import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/widgets/input_deposit.dart';
import 'package:flutter/material.dart';
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
              horizontal: constraints.maxWidth / 7.0, vertical: 20.0),
          child: Column(
            children: [
              Input(
                hintText: 'Informe uma descrição',
                controller: controller.descriptionController,
              ),
              const SizedBox(height: 20.0),
              InputRevenue(
                hintText: 'Informe o valor',
                controller: controller.amountController,
              ),
              const SizedBox(height: 20.0),
              Button(
                text: 'Depositar',
                onClick: () async => await controller.revenueController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
