import 'package:alura_challenge_mobile/app/core/utils/currency_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDeposit extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const InputDeposit({
    Key? key,    
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [        
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter()
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        hintText: hintText,
      ),
    );
  }
}

