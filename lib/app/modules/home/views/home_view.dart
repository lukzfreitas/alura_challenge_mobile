import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Income')),
      body: Column(children: [
        const Input(),
        Button(text: 'Transfer', onClick: () => {},),
      ],),
    );
  }
}