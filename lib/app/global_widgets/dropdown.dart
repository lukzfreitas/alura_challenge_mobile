import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';

import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {

  final List<DropdownItem> items;

  const Dropdown({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        items:
            items.map<DropdownMenuItem<DropdownItem>>((DropdownItem value) {
          return DropdownMenuItem<DropdownItem>(
            value: value,
            child: Text(value.title),
          );
        }).toList(),
        onChanged: (_) => {});
  }
}
