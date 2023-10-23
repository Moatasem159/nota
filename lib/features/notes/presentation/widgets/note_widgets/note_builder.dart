import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
class NoteBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  final VoidCallback onTap;
  const NoteBuilder({super.key, required this.note,required this.isGrid, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
  builder: (context, state) {
    return Material(
      color:note.color==Colors.transparent.value ? Colors.transparent : Color(note.color),
      borderRadius: BorderRadius.circular(10),
      elevation: 0,
      child: InkWell(
        onTap:(){
          if( BlocProvider.of<AppBarCubit>(context).isBase)
            {
              onTap();
            }
          else{
            BlocProvider.of<AppBarCubit>(context).selectNotes(note);
          }
        },
        onLongPress: (){
         BlocProvider.of<AppBarCubit>(context).selectNotes(note);
        },
        borderRadius:BorderRadius.circular(10),
        child: Container(
          padding: note.imagePath.isNotEmpty ?null:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: BlocProvider.of<AppBarCubit>(context).selectedNotes.contains(note)?4:(note.imagePath.isNotEmpty ?0.2:1),
                color:BlocProvider.of<AppBarCubit>(context).selectedNotes.contains(note)?Colors.blueAccent:(note.color==Colors.transparent.value?Theme.of(context).primaryColorLight:Colors.transparent)),
          ),
          constraints:  BoxConstraints(
            minWidth: isGrid?0:context.width-60,
            minHeight: 40,
            maxWidth: isGrid?context.width/2.5:context.width-60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(note.imagePath.isNotEmpty)
               ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                   child: Image(image: FileImage(File(note.imagePath)))),
                if(note.title.isNotEmpty||note.note.isNotEmpty)
                Padding(
                  padding:note.imagePath.isEmpty ?EdgeInsets.zero:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(note.title.isNotEmpty)
                      Text(note.title,style: Theme.of(context).textTheme.titleMedium),
                      if(note.note.isNotEmpty)
                        Column(
                          children: [
                            if(note.title.isNotEmpty)
                              10.ph,
                            Text(note.note,
                                maxLines: 40,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
          ),
        );
      },
    );
  }
}