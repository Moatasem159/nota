import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesGridList extends StatelessWidget {
  const NotesGridList({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NotesCubit, NotesStates>(
  builder: (context, state) {
    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
          padding: EdgeInsets.only(bottom: context.height / 15),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: BlocProvider.of<NotesCubit>(context).notes.length,
          shrinkWrap: true,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) => NoteWidget(isGrid: true,note:BlocProvider.of<NotesCubit>(context).notes[index])),
    );
  },
);
  }
}