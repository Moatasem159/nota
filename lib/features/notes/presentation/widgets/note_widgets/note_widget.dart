import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/config/routes/app_routes.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
class NoteWidget extends StatelessWidget{
  final Note note;
  final bool isGrid;
  const NoteWidget({super.key, required this.isGrid, required this.note});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: note,
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          onTap: () =>GoRouter.of(context).pushNamed(Routes.noteRoute,extra: note),
          onLongPress: (){
            note.delete();
            BlocProvider.of<NotesCubit>(context).getNotes();
          },
          borderRadius:BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Theme.of(context).primaryColorLight),
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
        ),
      ),
    ).addAllPadding(5);
  }
}