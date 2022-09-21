import 'package:alura_challenge_mobile/app/core/utils/currency_format.dart';
import 'package:alura_challenge_mobile/app/core/utils/date_format.dart';
import 'package:alura_challenge_mobile/app/data/models/revenue_model.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/controllers/revenue_controller.dart';
import 'package:alura_challenge_mobile/app/modules/revenue/widgets/card_item.dart';
import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
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
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardItem(
                            title: snapshot.data![index].description,
                            subtitle: DatetimeFormat.dateFormat(
                                date: snapshot.data![index].date),
                            trailing: CurrencyFormat.currencyFormat(
                              amount: snapshot.data![index].money.amount,
                              locale: 'en_US',
                              symbol: '\$',
                            ),
                            onClick: () => Get.offNamed(
                              Routes.revenue,
                              parameters: snapshot.data![index].toMapString(),
                            ),
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
