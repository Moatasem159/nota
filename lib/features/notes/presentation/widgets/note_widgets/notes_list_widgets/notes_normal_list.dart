import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class NotesNormalList extends StatelessWidget {
  const NotesNormalList({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: context.height / 15),
          shrinkWrap: true,
          itemCount: 15,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
          const NoteWidget(isGrid: false, content: "")),
    );
  }
}