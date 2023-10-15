import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesGridList extends StatelessWidget {
  final List<Note> notes;
  const NotesGridList({super.key, required this.notes});
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: MasonryGridView.builder(
          padding: EdgeInsets.only(bottom: context.height / 15),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notes.length,
          shrinkWrap: true,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, index) => NoteWidget(isGrid: true,note:notes[index])),
    );
  }
}