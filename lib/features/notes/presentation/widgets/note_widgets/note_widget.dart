import 'package:flutter/material.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
class NoteWidget extends StatelessWidget{
  final String content;
  final bool isGrid;
  const NoteWidget({super.key, required this.isGrid, required this.content});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius:BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).primaryColorLight
            )
          ),
          constraints:  BoxConstraints(
            minWidth: isGrid?0:context.width-60,
            maxWidth: isGrid?context.width/2.4:context.width-60,
            maxHeight:isGrid?context.height/4:context.height/3
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Title"),
              if(content.isNotEmpty)
              Column(
                children: [
                  10.ph,
                  Text(content),
                ],
              ),
            ],
          ),

        ),
      ),
    ).addAllPadding(5);
  }
}