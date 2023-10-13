import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.width/1.357,
      bottom: context.height-707,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Container(
          height: context.height/13.38181818181818,
          width: context.width/6.206896551724138,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              boxShadow: const [BoxShadow(spreadRadius: 1,color: Colors.white12,blurRadius: 1,blurStyle: BlurStyle.inner)]
          ),
          child: const Icon(Icons.add,size: 40),
        ),
      ),
    );
  }
}