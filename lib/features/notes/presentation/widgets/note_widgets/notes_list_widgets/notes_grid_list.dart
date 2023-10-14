import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesGridList extends StatelessWidget {
  const NotesGridList({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.builder(
          padding: EdgeInsets.only(bottom: context.height / 15),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 15,
          shrinkWrap: true,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, index) => const NoteWidget(
            isGrid: true,
            content: "")),
    );
  }
}