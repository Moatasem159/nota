import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesNormalList extends StatelessWidget {
  final List<Note> notes;
  const NotesNormalList({super.key, required this.notes});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: context.height / 15),
          shrinkWrap: true,
          itemCount: notes.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => NoteWidget(isGrid: false,note: notes[index])),
    );
  }
}