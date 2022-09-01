import 'package:alura_challenge_mobile/app/core/utils/icon_svg.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: 144.0,
        width: constraints.maxWidth,
        decoration: const BoxDecoration(
          color: Color(0xffAB47BC),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,                
                children: const [
                  Text(
                    "\$1000.00",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0,
                    ),
                  ),
                  Text(
                    "Balanço disponível",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              loadIconSvg(IconsSvg.user)
            ],
          ),
        ),
      ),
    );
  }
}
