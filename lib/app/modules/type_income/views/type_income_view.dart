import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/controllers/type_income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeIncomeView extends GetView<TypeIncomeController> {
  const TypeIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Tipo de Receita ou Despesa')),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 7.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Input(
                hintText: 'Informe o código',
                controller: controller.codeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              Input(
                hintText: 'Informe uma descrição',
                controller: controller.descriptionController,
              ),
              const SizedBox(height: 20.0),
              Button(
                text: 'Salvar',
                onClick: () async =>
                    await controller.createTypeIncomeController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
