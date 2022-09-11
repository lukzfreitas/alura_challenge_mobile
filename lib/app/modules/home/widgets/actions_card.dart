import 'package:alura_challenge_mobile/app/core/utils/icon_svg.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final double width;
  final String icon;
  final Function onClick;

  const ActionCard({
    Key? key,
    required this.title,
    required this.width,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: 83.0,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xff4B4B4B),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconsSvg.loadIconSvg(icon),
            const SizedBox(height: 11.0),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
