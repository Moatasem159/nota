import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.width/1.357,
      bottom: context.height-707,
      child: Material(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        animationDuration: const Duration(milliseconds: 5000),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: SizedBox(
            height: context.height/13.38181818181818,
            width: context.width/6.206896551724138,
            child: const Icon(Icons.add,size: 40),
          ),
        ),
      ),
    );
  }
}