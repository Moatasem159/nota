import 'package:flutter/material.dart';
class ListTitle extends StatelessWidget {
  final String title;
  const ListTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:Text(title,style: Theme.of(context).textTheme.titleSmall),
    );
  }
}