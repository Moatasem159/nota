import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class CustomGridList extends StatelessWidget {
  final List<Note> notes;
  final int padding;
  final bool inArchivedScreen;
  const CustomGridList({super.key, required this.notes, required this.padding, required this.inArchivedScreen});
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: context.height / padding),
      itemCount:notes.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) =>NoteWidget(inArchivedScreen: inArchivedScreen,isGrid: true, note:notes[index]),
    );
  }
}