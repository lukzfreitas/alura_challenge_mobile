import 'package:alura_challenge_mobile/app/core/utils/icon_svg.dart';
import 'package:alura_challenge_mobile/app/modules/home/widgets/actions_card.dart';
import 'package:alura_challenge_mobile/app/modules/home/widgets/activies_card.dart';
import 'package:alura_challenge_mobile/app/modules/home/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff373737),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: ActiviesCard(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ações da conta',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontSize: 23.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionCard(
                    width: constraints.maxWidth / 3.5,
                    icon: IconsSvg.WALLET,
                  ),
                  ActionCard(
                    width: constraints.maxWidth / 3.5,
                    icon: IconsSvg.CACHED,
                  ),
                  ActionCard(
                    width: constraints.maxWidth / 3.5,
                    icon: IconsSvg.CENTER_FOCO,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
