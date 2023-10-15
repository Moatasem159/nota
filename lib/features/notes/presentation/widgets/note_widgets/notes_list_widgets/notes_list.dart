
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_normal_list.dart';
class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context, state) {
        if (BlocProvider.of<NotesCubit>(context).isGrid) {
          return NotesGridList(
              notes: BlocProvider.of<NotesCubit>(context).notes);
        } else {
          return NotesNormalList(
              notes: BlocProvider.of<NotesCubit>(context).notes);
        }
      },
    );
  }
}