import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/modules/deposit/controllers/deposit_controller.dart';
import 'package:alura_challenge_mobile/app/modules/deposit/widgets/input_deposit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deposit')),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth / 7.0, vertical: 20.0),
          child: Column(
            children: [
              const InputDeposit(hintText: 'Inserir valor'),
              const SizedBox(height: 20.0),
              Button(
                text: 'Depositar',
                onClick: () async => await controller.depositController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
