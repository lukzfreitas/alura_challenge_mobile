import 'package:alura_challenge_mobile/app/data/models/dropdown_item_model.dart';

import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final List<DropdownItem> items;  
  final Function onChanged;
  final DropdownItem? item;
  final String? hintText;

  const Dropdown({
    Key? key,
    required this.items,
    required this.onChanged,    
    this.item,
    this.hintText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        hint: Text(hintText!),
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
