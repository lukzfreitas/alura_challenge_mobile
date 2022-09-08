import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String? value;
  final bool? disabled;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;

  const Input({
    Key? key,
    this.value = '',
    this.disabled = false,
    this.hintText = '',
    this.isPassword = false,
    this.controller,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      inputFormatters: inputFormatters ?? [],
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        hintText: hintText,
      ),
    );
  }
}
