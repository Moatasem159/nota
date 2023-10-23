import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesNormalList extends StatelessWidget {
  const NotesNormalList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return ListView.builder(
            padding: EdgeInsets.only(bottom: context.height / 15),
            itemCount: BlocProvider.of<NotesCubit>(context).notes.length,
            itemBuilder: (context, index) => NoteWidget(isGrid: false, note: BlocProvider.of<NotesCubit>(context).notes[index]));
      },
    );
  }
}