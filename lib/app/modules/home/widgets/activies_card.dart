import 'package:flutter/cupertino.dart';

class ActiviesCard extends StatelessWidget {
  const ActiviesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 173.0,
      decoration: const BoxDecoration(
        color: Color(0xff4B4B4B),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );
  }
}
