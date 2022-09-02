import 'package:flutter/cupertino.dart';

class ActiviesCard extends StatelessWidget {

  final String amount;

  const ActiviesCard({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: 173.0,
        width: constraints.maxWidth,
        decoration: const BoxDecoration(
          color: Color(0xff4B4B4B),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total gasto',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Esse mês você gastou \$1500.00 com jogos. Tente abaixar esse custo!',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                child: Text(
                  'Diga-me como',
                  style: TextStyle(
                    color: Color(0xffB20CBB),                    
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
