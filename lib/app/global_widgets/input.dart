import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final bool isPassword;
  final TextInputType keyboardType;  
  final bool? disabled;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;    
  final Function? validator;
  final Function? onChanged;

  const Input({
    Key? key,
    this.disabled = false,
    this.hintText = '',
    this.isPassword = false,
    this.controller,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,    
    this.validator,    
    this.onChanged,
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
      validator: (value) => validator!(),
      onChanged: (value) => onChanged!(),
    );
  }
}
