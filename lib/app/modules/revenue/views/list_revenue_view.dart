import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRevenueView extends GetView<RevenueController> {
  const ListRevenueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Últimas Receitas")),
      body: FutureBuilder<List<RevenueModel>>(
        future: controller.listRevenueController(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data![index].description),
                        );
                      },
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
