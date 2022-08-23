import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? value;
  final bool? disabled;
  final String? hintText;
  final TextEditingController? controller;

  const Input({
    Key? key,
    this.value = '',
    this.disabled = false,
    this.hintText = '',
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        hintText: hintText,      
      ),
    );
  }
}
