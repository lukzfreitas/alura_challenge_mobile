import 'package:alura_challenge_mobile/app/data/models/type_income_model.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/widgets/card_item.dart';
import 'package:alura_challenge_mobile/app/modules/type_income/controllers/type_income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTypeIncomeView extends GetView<TypeIncomeController> {
  const ListTypeIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tipos de Receitas e Despesas')),
      body: FutureBuilder<List<TypeIncome>>(
        future: controller.listTypeIncomeController(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardItem(
                            title: snapshot.data![index].description,
                            subtitle: snapshot.data![index].code.toString(),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text('Não há receitas neste mês'),
                    );
            default:
              return const Center(child: Text('Não há receitas neste mês'));
          }
        },
      ),
    );
  }
}
