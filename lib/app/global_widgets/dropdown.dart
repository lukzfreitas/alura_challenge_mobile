import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';

import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final List<DropdownItem> items;
  final DropdownItem? item;
  final Function onChanged;

  const Dropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        items: items.map<DropdownMenuItem<DropdownItem>>((DropdownItem item) {
          return DropdownMenuItem<DropdownItem>(
            value: item,
            child: Text(item.title),
          );
        }).toList(),
        onChanged: (item) => onChanged(item));
  }
}
