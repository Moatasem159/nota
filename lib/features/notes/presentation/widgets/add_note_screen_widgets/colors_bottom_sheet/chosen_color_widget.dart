import 'package:flutter/material.dart';
class ChosenColorWidget extends StatelessWidget {
  const ChosenColorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 3)),
      child: const Icon(Icons.done_rounded, color: Colors.blue, size: 40));
  }
}