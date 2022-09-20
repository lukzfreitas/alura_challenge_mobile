import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? trailing;
  final Function? onClick;

  const CardItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick!(),
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle ?? ''),
          trailing: Text(trailing ?? ''),
        ),
      ),
    );
  }
}
