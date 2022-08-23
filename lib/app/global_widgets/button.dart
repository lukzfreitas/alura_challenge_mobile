import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;

  const Button({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding:
              const EdgeInsets.symmetric(vertical: 32.0, horizontal: 48.0)),
      onPressed: () => onClick(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
