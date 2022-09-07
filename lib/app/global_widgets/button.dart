import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;
  final double height;
  final double width;

  const Button(
      {Key? key,
      required this.text,
      required this.onClick,
      this.height = 32.0,
      this.width = 16.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: width, horizontal: height)),
      onPressed: () => onClick(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
