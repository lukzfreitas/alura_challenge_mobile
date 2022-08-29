import 'package:alura_challenge_mobile/app/core/utils/icon_svg.dart';
import 'package:flutter/cupertino.dart';

class ActionCard extends StatelessWidget {
  final double width;
  final String icon;

  const ActionCard({Key? key, required this.width, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.0,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xff4B4B4B),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Column(
        children:[
          LoadIconSvg(icon),
        ] 
      ),
    );
  }
}
