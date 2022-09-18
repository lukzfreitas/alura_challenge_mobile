import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? trailing;

  const CardItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle ?? ''),
        trailing: Text(trailing ?? ''),
      ),
    );
  }
}
