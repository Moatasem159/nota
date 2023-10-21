import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
class NoteBuilder extends StatelessWidget {
  final Note note;
  final bool isGrid;
  final VoidCallback onTap;
  const NoteBuilder({super.key, required this.note,required this.isGrid, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      onLongPress: (){
        note.delete();
        BlocProvider.of<NotesCubit>(context).getNotes();
      },
      borderRadius:BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color:note.color==Colors.transparent.value ? null : Color(note.color),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:note.color==Colors.transparent.value?Theme.of(context).primaryColorLight:Colors.transparent),
        ),
        constraints:  BoxConstraints(
          minWidth: isGrid?0:context.width-60,
          minHeight: 40,
          maxWidth: isGrid?context.width/2.4:context.width-60,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(note.title.isNotEmpty)
              Text(note.title),
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
    );
  }
}