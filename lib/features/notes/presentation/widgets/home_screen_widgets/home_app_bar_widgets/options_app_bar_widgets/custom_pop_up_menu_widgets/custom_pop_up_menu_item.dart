import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
class CustomPopUpMenuItem extends StatelessWidget{
  final String title;
  const CustomPopUpMenuItem({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width/2.4,
        child: Text(title)
    );
  }
}